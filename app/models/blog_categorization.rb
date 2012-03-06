class BlogCategorization < ActiveRecord::Base

  belongs_to :blog
  belongs_to :blog_category

end
