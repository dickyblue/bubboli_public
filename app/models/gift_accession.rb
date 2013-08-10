class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id, :approved

  belongs_to :gift
  belongs_to :giftee, :class_name => "Child", :foreign_key => 'child_id'
  belongs_to :giver, :class_name => "User", :foreign_key => 'user_id'
  
  before_save :approve_gifts_from_parents
  # after_save :set_gift_alert, :on => :create
  after_create :send_gift_alert_email
  
  def approve_gifts_from_parents
    if self.giver.is_parent_of?(self.giftee)
      self.approved = "true"
    end
  end
  
  def send_gift_alert_email
    unless self.giver.is_parent_of?(self.giftee)
      generate_token(:gift_accession_token)
      self.gift_accession_token_sent_at = Time.now
      save!
      GiftAlertMailer.delay.gift_alert(self) if self.giftee.parents
    end
  end
  
  def approve!
    self.approved = true
    # self.gift_accession_token = nil
    save(:validate => false)
  end
  
  private
  
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while GiftAccession.exists?(column => self[column])
    end
    
end
