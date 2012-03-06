class Comment < ActiveRecord::Base

  belongs_to :blog, :foreign_key => 'blog_id'
  
  attr_accessible :commenter, :commenter_email, :commenter_permalink, :content, :blog_id
  validates :commenter, :content, :presence => true
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :commenter_email, :presence => true, :format => EMAIL_REGEX

end
