class BlogCategorization < ActiveRecord::Base

  attr_accessible :blog_category_id, :blog_id

  belongs_to :blog
  belongs_to :blog_category

end
