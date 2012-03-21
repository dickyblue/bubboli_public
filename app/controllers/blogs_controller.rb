class BlogsController < ApplicationController

  layout "blog"
  
  before_filter :authenticate, :except => [:index, :show, :archive]

  include ApplicationHelper
  include BlogsHelper


  def index
    @all_blog_categories = get_all_categories
    published_blog_search
    set_archive_list
  end
  
  def list
    @blogs = Blog.find(:all)
  end

  def manage
    @blog = Blog.new if @blog.nil?
    @blog.build_blog_image
    @blog = Blog.find(params[:id]) if params[:id]
    @all_blog_categories = get_all_categories
  end
  
  def create
    @all_blog_categories = get_all_categories
    checked_blog_categories = get_blog_categories_from(params[:blog_categories])
    removed_blog_categories = @all_blog_categories - checked_blog_categories
    @blog = Blog.new(params[:blog])
    if @blog.save
      checked_blog_categories.each {|cat| @blog.blog_categories << cat if !@blog.blog_categories.include?(cat)}
      removed_blog_categories.each {|cat| @blog.blog_categories.delete(cat) if @blog.blog_categories.include?(cat)}
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @all_blog_categories = get_all_categories
    checked_blog_categories = get_blog_categories_from(params[:blog_categories])
    removed_blog_categories = @all_blog_categories - checked_blog_categories
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      checked_blog_categories.each {|cat| @blog.blog_categories << cat if !@blog.blog_categories.include?(cat)}
      removed_blog_categories.each {|cat| @blog.blog_categories.delete(cat) if @blog.blog_categories.include?(cat)}
      redirect_to(:action => 'show')
    else
      render "manage"
    end    
  end
  
  def show
    @blog = Blog.find(params[:id])
    @new_comment = @blog.comments.build
    @all_blog_categories = get_all_categories
    published_blog_search
    set_archive_list
    @comments = Comment.where(:blog_id => @blog.id)
  end
  
  def archive
    start_time = Time.mktime( params[:year] || 2012, 
                              params[:month] || 1,
                              params[:day] || 1)
    end_time = start_time.next_month
    @all_blog_categories = get_all_categories    
    published_blog_search 
    @blogs_by_month = @blogs.where(['blogs.publish_date BETWEEN ? AND ?', start_time, end_time]) 
    set_archive_list
  end
    
  def destroy
    Blog.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
