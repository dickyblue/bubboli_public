class GiftImage < ActiveRecord::Base

  attr_accessible :image, :remote_image_url
  
  belongs_to :gift, :foreign_key => 'gift_id'
  
  mount_uploader :image, GiftImageUploader

end
