class GiftCategorization < ActiveRecord::Base

  attr_accessible :gift_category_id, :gift_id

  belongs_to :gift_category
  belongs_to :gift

  def self.gift_by_matching_cat(rel)
    if rel.user_child_cat_prefs.empty?
      self.where(:gift_category_id => GiftCategory.all)
    else
      categories = rel.user_child_cat_prefs.map {|p| p.gift_category_id }
      self.where(:gift_category_id => categories)
    end
  end

end
