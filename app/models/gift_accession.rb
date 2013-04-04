class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id, :approved

  belongs_to :gift
  belongs_to :giftee, :class_name => "Child", :foreign_key => 'child_id'
  belongs_to :giver, :class_name => "User", :foreign_key => 'user_id'
  
  before_save :approve_gifts_from_parents
  
  def approve_gifts_from_parents
    if self.giver.is_parent_of?(self.giftee)
      self.approved = "true"
    end
  end
    
end
