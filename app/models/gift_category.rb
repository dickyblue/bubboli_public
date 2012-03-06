class GiftCategory < ActiveRecord::Base

  attr_accessible :name
  
  has_many :gift_categorizations
  has_many :gifts, :through => :gift_categorizations
  

end
