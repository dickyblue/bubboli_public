class Relationship < ActiveRecord::Base

  attr_accessible :user_id, :child_id, :relation_type_id, :gift_category_ids
  belongs_to  :user
  belongs_to  :child
  belongs_to  :relation_type
  
  has_many    :user_child_category_preferences
  has_many    :gift_categories, :through => :user_child_category_preferences
  

  def child_city(ch)
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
  end 
  
  def child_state(ch)
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
  end 

  def child_mother(ch)
    child = self.child
    child.relationships.where(:relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
  end 

  def child_father(ch)
    child = self.child
    child.relationships.where(:relation_type_id => 2).map {|p| p.user.first_name }.to_sentence
  end 

  # delete method gift_by_gender after testing that it is the same
  def gift_by_gender(ch)
    Gift.where(:gender => [ch.gender, "Unisex"]).map {|p| p.name }
  end
  
  
end
