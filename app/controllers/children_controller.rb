class ChildrenController < ApplicationController

  include SessionsHelper
  
  before_filter :authenticate
  

  def search_child
    @search = User.search(params[:search])
    @users = @search.all            
  end


  def add_my_child

  end
  
  def create
    @child = Child.new(params[:child])
    if @child.save
      @child.relationships.each do |relationship|
        relationship.user = current_user
        relationship.save!
      end
      redirect_to current_user
    else
      render "add_my_child"
    end
  end
  
  def show
    @child = Child.find(params[:id])
  end


end
