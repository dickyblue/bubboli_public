class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id, :approved

  belongs_to :gift
  belongs_to :giftee, :class_name => "Child", :foreign_key => 'child_id'
  belongs_to :giver, :class_name => "User", :foreign_key => 'user_id'
  
  before_save :approve_gifts_from_parents
  after_save :send_gift_alert_email, :on => :create
  
  def approve_gifts_from_parents
    if self.giver.is_parent_of?(self.giftee)
      self.approved = "true"
    end
  end
  
  def send_gift_alert_email
    GiftAlertMailer.gift_alert(self).deliver
  end
    
end
