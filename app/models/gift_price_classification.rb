class GiftPriceClassification < ActiveRecord::Base
  
  belongs_to  :gift
  belongs_to  :gift_price_range

  def self.user_child_price_pref(rel)
    if rel.user_child_price_prefs.empty?
      self.where(:gift_price_range_id => GiftPriceRange.all)
    else
      price_pref = rel.user_child_price_prefs.map {|p| p.gift_price_range_id }
      self.where(:gift_price_range_id => price_pref)      
    end
  end

end
