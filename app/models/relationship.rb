class Relationship < ActiveRecord::Base

  attr_accessible :user_id, :child_id, :relation_type_id, :gift_category_ids, :gift_price_range_ids, :status, :accepted_at
  belongs_to  :user
  belongs_to  :child
  belongs_to  :relation_type
  
  has_many    :user_child_cat_prefs
  has_many    :gift_categories, :through => :user_child_cat_prefs
  
  has_many    :user_child_price_prefs
  has_many    :gift_price_ranges, :through => :user_child_price_prefs
  
  validates_uniqueness_of :user_id, :scope => :child_id
  
  before_save :change_rel_status, :parent_count

  def change_rel_status
    if self.relation_type_id == 1
      self.status = "Confirmed"
      self.accepted_at = Time.now
    elsif self.relation_type_id == 2
      self.status = "Confirmed"
      self.accepted_at = Time.now
    end
  end
  
  
  private 
  
    def parent_count
      #:message => "Relationship already exists" if child.relationships.where(:relation_type_id => 1).exists?
      # errors.add(:relation_type_id, "already exists for this child") if child.relationships.where(:relation_type_id => 1).size > 1
    end
      
end
