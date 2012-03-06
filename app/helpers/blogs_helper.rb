module BlogsHelper

  def get_all_categories
    return BlogCategory.find(:all)
  end
  
  def get_blog_categories_from(cat_list)
    cat_list =[] if cat_list.blank?
    return cat_list.collect {|cid| BlogCategory.find_by_id(cid.to_i)}.compact
  end
  
  def published_blog_search
    @search = Blog.where(:blogs => {:published => true}).search(params[:search])
    @blogs = @search.paginate(:page => params[:page], :per_page => 9, :order => "publish_date DESC")
  end
  
  def set_archive_list
    blogs = Blog.where(:published => true)
    @archive_list = blogs.collect do |p|
      [p.publish_date.strftime("%B %Y"), p.publish_date.year, p.publish_date.month]
    end
    @archive_list.uniq!    
  end
  

end
