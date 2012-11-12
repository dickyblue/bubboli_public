class ChildrenController < ApplicationController

  include SessionsHelper
  
  before_filter :authenticate
  

  def search_child
    @search = User.search(params[:search])
    @users = @search.all            
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
  
  def show
    @child = Child.find(params[:id])
    @city = @child.relationships.where(:child_id => @child.id, :relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
    @state = @child.relationships.where(:child_id => @child.id, :relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
    @relationship = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name }.to_sentence
    @mother = @child.relationships.where(:child_id => @child.id, :relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
    @relationship_table = Relationship.where(:child_id => @child.id, :user_id => current_user.id).map {|p| p.id}
  end


end
