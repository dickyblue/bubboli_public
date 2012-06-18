class ChildrenController < ApplicationController

  def search_child
    @search = User.search(params[:search])
    @users = @search.all            
  end


  def add_my_child
    @child = Child.new
  end


end
