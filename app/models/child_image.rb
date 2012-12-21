class ChildImage < ActiveRecord::Base

  attr_accessible :image, :remote_image_url
  
  belongs_to :child, :foreign_key => 'child_id'
  
  mount_uploader :image, ChildImageUploader


end
