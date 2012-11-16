class GiftCategory < ActiveRecord::Base

  attr_accessible :name
  
  has_many :gift_categorizations
  has_many :gifts, :through => :gift_categorizations
  has_many :user_child_category_preferences
  has_many :relationships, :through => :user_child_category_preferences

end
