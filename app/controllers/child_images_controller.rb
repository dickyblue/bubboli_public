class ChildImagesController < ApplicationController

  before_filter :get_child

  def index
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @child_images = @child.child_images
  end

  def new
    @child_image = @child.child_images.build
  end
  
  def create
    @child_image = @child.child_images.create(params[:child_image])
    respond_to do |format|
      format.html { redirect_to(:action => 'index') }
      format.js
    end  
  end
  
  def edit
    @child_image = @child.child_images.find(params[:id])   
  end
  
  def update
    @child_image = @child.child_images.find(params[:id])
    if @child_image.update_attributes(params[:child_image])
      render "index"
    else
      render "edit"
    end
  end
  
  def show
    @child_images = @child.child_images.find(params[:id])
  end


  private
  
  def get_child
    @child = Child.find(params[:child_id])
  end

end
