class GiftPriceRange < ActiveRecord::Base

  has_many  :user_child_price_prefs
  has_many  :relationships, :through => :user_child_price_prefs


end
