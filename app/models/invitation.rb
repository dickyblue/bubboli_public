class Invitation < ActiveRecord::Base

  has_one     :recipient, :class_name => 'User'
  belongs_to  :sender, :class_name => 'User', :foreign_key => 'sender_id'
  has_one     :child

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
