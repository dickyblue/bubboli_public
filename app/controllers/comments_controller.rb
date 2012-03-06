class CommentsController < ApplicationController


  
  def list
    @comments = Comment.find(:all, :order => 'created_at DESC')
  end

  def show
    @comment = Comment.find(params[:id])
    @blog = Comment.where(:blog_id => @blog.ids)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to :back
    else
      flash[:error] = "Please check to make sure your email is in the proper format and all the required fields are filled out." 
      redirect_to(:back, :anchor => 'comments')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
