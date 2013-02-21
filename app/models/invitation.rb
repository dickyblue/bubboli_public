class Invitation < ActiveRecord::Base

  has_one     :recipient, :class_name => 'User'
  belongs_to  :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to  :child

  validates :recipient_email, :presence => true

  validate :recipient_is_not_registered_email
  validate :recipient_is_not_registered_work_email
  
  before_create :generate_token
  after_create :send_invitation_token
  
  def send_invitation_token
    self.sent_at = Time.zone.now
    save!
    InvitationMailer.invitation(self).deliver
  end
  
  def self.invitation_by_email(user)
    invitations = self.where(:recipient_email => [user.email, user.work_email])
  end  
    
  def self.invited_children(user) 
    invitations = invitation_by_email(user) 
    child_ids = invitations.pluck(:child_id)
  end
  
  def confirm_as_child(confirmed_child)
    relationships = self.child.relationships
    relationships.each {|r| r.update_attribute :child_id, confirmed_child.id }
    self.child.child_images.each {|i| i.update_attribute :child_id, confirmed_child.id} #moving all images to the new child record
    self.child.delete #dont use destroy since we dont want to trigger the dependent#destroy on the Child class.
    self.destroy
  end
  
  private
  
  def recipient_is_not_registered_email
    errors.add :email, "#{recipient_email} is already registered.  
    Please search for the child in the search window by the parent's email address" if User.find_by_email(recipient_email)
  end

  def recipient_is_not_registered_work_email
    errors.add :email, "#{recipient_email} is already registered.  
    Please search for the child in the search window by the parent's email address" if User.find_by_work_email(recipient_email)
  end
  
  def generate_token
    self.invitation_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
  
  

end
