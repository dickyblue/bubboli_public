class Relationship < ActiveRecord::Base

  attr_accessible :user_id, :child_id, :relation_type_id, :gift_category_ids
  belongs_to  :user
  belongs_to  :child
  belongs_to  :relation_type
  
  has_many    :user_child_category_preferences
  has_many    :gift_categories, :through => :user_child_category_preferences
  
end
