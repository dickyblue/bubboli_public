class GiftAgeRange < ActiveRecord::Base
  
  attr_accessible :name

  has_many  :gift_age_classifications
  has_many  :gifts, :through => :gift_age_classifications


  
end
