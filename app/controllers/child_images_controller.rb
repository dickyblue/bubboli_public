class ChildImagesController < ApplicationController

  def new
    @child_image = ChildImage.new
  end
  
  def create
    @child_image = ChildImage.new(params[:child_image])
    if @child_image.save
      render "show"
    else
      render "new"
    end
  end
  
  def edit
    @child_image = ChildImage.find(params[:id])    
  end
  
  def update
    @child_image = ChildImage.find(params[:id])
    if @child_image.update_attributes(params[:child_image])
      render "index"
    else
      render "edit"
    end
  end
  
  def show
    @child_images = ChildImage.where
  end

end
