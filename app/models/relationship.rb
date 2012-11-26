class Relationship < ActiveRecord::Base

  attr_accessible :user_id, :child_id, :relation_type_id, :gift_category_ids
  belongs_to  :user
  belongs_to  :child
  belongs_to  :relation_type
  
  has_many    :user_child_category_preferences
  has_many    :gift_categories, :through => :user_child_category_preferences
  

  def child_city
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
  end 
  
  def child_state
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
  end 

  def child_mother
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
  end 

  def child_father
    child = self.child
    child.relationships.where(:relation_type_id => 2).map {|p| p.user.first_name }.to_sentence
  end 
  
  def user_child_categories
    categories = self.user_child_category_preferences.map {|p| p.gift_category_id}
    GiftCategorization.where(:gift_category_id => categories).map {|p| p.gift.name}
  end
  
end
