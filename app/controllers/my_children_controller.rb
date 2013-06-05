class MyChildrenController < ApplicationController

  include SessionsHelper
  
  before_filter :authenticate

  def new
    @my_child = Child.new
  end
  
  def create
    @my_child = Child.new(params[:child])
      if @my_child.save
      #@my_child.relationships.last.update_attributes(:user_id => current_user.id, :relation_type_id => 1)
      @my_child.relationships.create!(:user_id => current_user.id, :relation_type_id => 1)
      redirect_to current_user
    else
      render "new"
    end
  end
  
end
