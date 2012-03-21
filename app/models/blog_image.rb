class BlogImage < ActiveRecord::Base

  attr_accessible :image, :image2, :image3, :image4, :remote_image_url, :remote_image2_url, :remote_image3_url, :remote_image4_url
  
  belongs_to :blog, :foreign_key => 'blog_id'
  
  mount_uploader :image, BlogImageUploader
  mount_uploader :image2, BlogImageUploader
  mount_uploader :image3, BlogImageUploader
  mount_uploader :image4, BlogImageUploader

end
