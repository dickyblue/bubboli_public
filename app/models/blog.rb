class Blog < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  attr_accessible :image, :remote_image_url, :title, :author, :content, :author_permalink, :published, :publish_date, :blog_image_attributes, :blog_category_ids
  
  has_one  :blog_image
  has_many :comments, :dependent => :destroy
  has_many :blog_categorizations
  has_many :blog_categories, :through => :blog_categorizations
  
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :blog_image
  
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
  
# Using friendly_id gem instead  
#  def to_param
#    "#{id}-#{title.parameterize}"
#  end
  
  
end
