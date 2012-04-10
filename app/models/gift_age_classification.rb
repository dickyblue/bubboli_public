class GiftAgeClassification < ActiveRecord::Base

  attr_accessible :gift_age_range_id, :gift_id

  belongs_to  :gift
  belongs_to  :gift_age_range
  

end
