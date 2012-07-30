class RelationshipsController < ApplicationController

  include SessionsHelper


  def create
    @child = Child.new(params[:child])
    @relationship = current_user.relationships.new(params[:relationship])
    if @relationship.save
      @relationship.child = @child
      redirect_to current_user
    else
      render "new"
    end
  end
  

end
