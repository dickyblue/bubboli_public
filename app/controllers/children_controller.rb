class ChildrenController < ApplicationController

  include SessionsHelper
  
  before_filter :authenticate
  

  def search_child
    @search = Child.search(params[:search])
    @children = @search.where("relationships.relation_type_id" => [1,2])
  end


  def new
    @child = Child.new
    @child.invitations.build
  end
  
  def create
    @child = Child.new(params[:child])
    @child.invitations.last.sender = current_user
    if @child.save
      @child.relationships.last.update_attributes(:user_id => current_user.id)
      redirect_to current_user
    else
      render "new"
    end
  end

  def edit
    @child = Child.find(params[:id])
    @child.child_images.build
  end


  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(params[:child])
      redirect_to current_user
    else
      render "edit"
    end
  end
  
  def photos
    @child = Child.find(params[:id])
    @image = @child.child_images.build
    @child_images = @child.child_images
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
  end


end
