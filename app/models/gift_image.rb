class GiftImage < ActiveRecord::Base

  attr_accessible :image, :image2, :image3, :image4, :remote_image_url, :remote_image2_url, :remote_image3_url, :remote_image4_url
  
  belongs_to :gift, :foreign_key => 'gift_id'
  
  mount_uploader :image, GiftImageUploader
  mount_uploader :image2, GiftImageUploader
  mount_uploader :image3, GiftImageUploader
  mount_uploader :image4, GiftImageUploader



end
