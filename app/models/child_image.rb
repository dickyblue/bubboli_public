class ChildImage < ActiveRecord::Base

  attr_accessible :image, :remote_image_url
  
  belongs_to :child, :foreign_key => 'child_id'
  
  before_save :validate_only_one_profile_picture

  mount_uploader :image, ChildImageUploader

  def set_as_profile_picture
    self.child.child_images.each {|c| c.update_column(:profile, :false)}
    self.profile = true
    self.save!
  end

  def validate_only_one_profile_picture
    self.child.child_images.where(:profile => true).count <= 1
  end

end
