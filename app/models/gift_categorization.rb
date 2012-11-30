class GiftCategorization < ActiveRecord::Base

  attr_accessible :gift_category_id, :gift_id

  belongs_to :gift_category
  belongs_to :gift

  def self.gift_by_matching_cat(rel)
    categories = rel.user_child_cat_prefs.map {|p| p.gift_category_id}
    self.where(:gift_category_id => categories).group("gift_categorizations.gift_id").order("count(gift_categorizations.gift_id) DESC")    
  end

  def self.gift_by_three_matching_cat(rel)
    categories = rel.user_child_cat_prefs.map {|p| p.gift_category_id}
    self.where(:gift_category_id => categories).group("gift_categorizations.gift_id").having("count(gift_categorizations.gift_id) > 0 ").order("count(gift_categorizations.gift_id) DESC")    
  end

  def self.gift_by_two_matching_cat(rel)
    categories = rel.user_child_cat_prefs.map {|p| p.gift_category_id}
    self.where(:gift_category_id => categories).group("gift_categorizations.gift_id").having("count(gift_categorizations.gift_id) > 1").order("count(gift_categorizations.gift_id) DESC") 
  end

  def self.cat_result(rel)
    a = self.gift_by_three_matching_cat(rel)
    b = self.gift_by_two_matching_cat(rel)
    d = self.gift_by_matching_cat(rel)
    (a + b + d)[0,5]
  end
end
