class BlogCategory < ActiveRecord::Base

  attr_accessible :name

  has_many :blog_categorizations
  has_many :blogs, :through => :blog_categorizations


end
