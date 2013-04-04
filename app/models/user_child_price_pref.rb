class UserChildPricePref < ActiveRecord::Base
  
  belongs_to  :relationship
  belongs_to  :gift_price_range


end
