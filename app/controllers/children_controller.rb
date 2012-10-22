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
  end


end
