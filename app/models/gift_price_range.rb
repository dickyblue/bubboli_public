class GiftPriceRange < ActiveRecord::Base

  has_many  :user_child_price_prefs
  has_many  :relationships, :through => :user_child_price_prefs

  has_many  :gift_price_classifications
  has_many  :gifts, :through => :gift_price_classifications

end
