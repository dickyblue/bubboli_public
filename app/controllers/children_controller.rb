class ChildrenController < ApplicationController

  include SessionsHelper
  
  before_filter :authenticate
  

  def search_child
    @search = Child.search params[:search]
    @search_term = params[:search].values[0] if params[:search]
    #@search = Child.search(by_email) | Child.search(by_work_email)
    @children = @search.where("relationships.relation_type_id" => 1)
    #@user = @search.where("relationships.relation_type_id" => 3)
  end


  def new
    @child = Child.new
    @child.invitations.build
  end
  
  def create
    @child = Child.new(params[:child])
    if @child.save
      @child.relationships.create!(:user_id => current_user.id, :relation_type_id => params[:child][:relation_type_ids].to_i)
      @child.invitations.create!(:sender => current_user, :recipient_email => params[:invitee])
      redirect_to current_user
    else
      flash[:error] = "User is already registered, but does not have children of their own."
      render "new"
    end
  end

  def edit
    @child = Child.find(params[:id])
  end


  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(params[:child])
      redirect_to current_user
    else
      render "edit"
    end
  end


end
