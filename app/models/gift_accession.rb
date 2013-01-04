class GiftAccession < ActiveRecord::Base

  attr_accessible :gift_id, :user_id, :approved

  belongs_to :gift
  belongs_to :child
  belongs_to :user
  
    
end
