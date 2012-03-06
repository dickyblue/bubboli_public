class Blog < ActiveRecord::Base

  attr_accessible :image, :remote_image_url, :title, :author, :content, :author_permalink, :published, :publish_date
  
  has_many :comments, :dependent => :destroy
  has_many :blog_categorizations
  has_many :blog_categories, :through => :blog_categorizations
  
  accepts_nested_attributes_for :comments
      
  mount_uploader :image, BlogImageUploader
  
  #scope :next, lambda {|created_at| where(["published = ? && created_at > ?", true, created_at]).order("created_at ASC") } # this is the default ordering for AR
  #scope :previous, lambda {|created_at| where(["published = ? && created_at > ?", true, created_at]).order("created_at DESC") }

  #def next
   # Blog.next(self.id).first
  #end

  #def previous
   # Blog.previous(self.id).first
  #end  

  def previous_blog
    self.class.first(:conditions => ["published = ? && created_at > ?", true, created_at], :order => "created_at desc")
  end

  def next_blog
    self.class.first(:conditions => ["published = ? && created_at > ?", true, created_at], :order => "created_at asc")
  end
  

  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  
end
