class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id

  belongs_to :gift
  belongs_to :child
  belongs_to :user
  
  scope :approved_purchased_gifts, where(:approved => true)
    
end
