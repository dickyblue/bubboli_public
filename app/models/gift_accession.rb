class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id, :approved

  belongs_to :gift
  belongs_to :giftee, :class_name => "Child", :foreign_key => 'child_id'
  belongs_to :giver, :class_name => "User", :foreign_key => 'user_id'
  
    
end
