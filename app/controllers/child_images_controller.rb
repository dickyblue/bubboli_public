class ChildImagesController < ApplicationController

  before_filter :get_child, :except => [:set_as_profile_picture]

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

  def set_as_profile_picture
    @child_image = ChildImage.find(params[:id])
    @child_image.set_as_profile_picture
    @child = @child_image.child
    @relationships = Relationship.where('user_id = ? AND child_id = ?', current_user.id, @child.id)
    if @relationships.any?
      redirect_to relationship_path(@relationships.first)
      flash[:success] = 'Profile picture for this relationship has been set'
    else
      redirect_to 'index'
      flash[:error] = 'Oops there was a problem, please try again'
    end
  end


  private
  
  def get_child
    @child = Child.find(params[:child_id])
  end

end
