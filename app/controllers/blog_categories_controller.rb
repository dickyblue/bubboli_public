class BlogCategoriesController < ApplicationController

  before_filter :authenticate
  include ApplicationHelper
  include BlogsHelper

  def index
    @blog_category = BlogCategory.find(params[:id])
  end

  def list
    @blog_categories = BlogCategory.find(:all)
  end

  def manage
    list
    @blog_category = BlogCategory.find(params[:id]) if params[:id]
    @blog_category = BlogCategory.new if @blog_category.nil?
  end
  
  
  def create
    @blog_category = BlogCategory.new(params[:blog_category])
    if @blog_category.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def update
    @blog_category = BlogCategory.find(params[:id])
    if @blog_category.update_attributes(params[:blog_category])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
#  def show
#    @search = Blog.where(:blogs => {:published => true}).search(params[:search])
#    @all_blog_categories = get_all_categories
#    @blog_category = BlogCategory.find(params[:id])
#    @blogs = @blog_category.blogs.where(:published => true).paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
#    set_archive_list
#  end
  
  def destroy
    BlogCategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  


end
