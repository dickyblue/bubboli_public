class Gift < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender, :baby_shower,
  :gift_category_ids, :gift_images_attributes, :gift_price_range_ids, :description, :why_bubboli_loves_it, :favorite, :gift_age_range_ids
  
  attr_searchable :name, :gender, :description
  
  validates :name, :permalink, :price, :merchant, :presence => true
  
  has_many  :gift_images, :order => "id ASC" 
  has_many  :gift_categorizations
  has_many  :gift_categories, :through => :gift_categorizations
  has_many  :gift_age_classifications
  has_many  :gift_age_ranges, :through => :gift_age_classifications  
  has_many  :user_child_price_prefs
  has_many  :relationships, :through => :user_child_price_prefs
  
  has_many  :gift_price_classifications
  has_many  :gift_price_ranges, :through => :gift_price_classifications
  
  has_many  :gift_accessions
  has_many  :users, :through => :gift_accessions 
  has_many  :children, :through => :gift_accessions
  
  accepts_nested_attributes_for :gift_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  
  scope :recently_added, lambda { where("gifts.created_at <= ? AND gifts.created_at >= ?", Date.today, Date.today - 30) }
  scope :baby_shower_gifts, lambda { where("baby_shower = ?", true) }

# Using friendly_id gem instead  
#  def to_param
#    "#{id}-#{name.parameterize}"
#  end
  
  def self.gender_search(gender)
    Gift.where(:gender => [gender, 'Unisex'])
  end
   
  search_methods :gender_search

  def self.get_gift_by_gender_age_price(child, rel)
    result = self.where(:gender => [child.gender, "Unisex"]).joins(:gift_age_classifications).merge(GiftAgeClassification.gift_by_age_range(child))
    result.joins(:gift_price_classifications).merge(GiftPriceClassification.user_child_price_pref(rel))
  end
  
  def self.gift_by_pref_all_cat(child, rel, limit=10)
    self.get_gift_by_gender_age_price(child, rel).joins(:gift_categorizations).merge(GiftCategorization.gift_by_matching_cat(rel)).limit(limit).sort_by do |gift|
      gift.gift_categorizations.count
    end.uniq
  end
  
  def self.final_filtered_gifts(child, rel, limit=10)
    filtered_gifts = self.gift_by_pref_all_cat(child, rel, limit=10).collect {|gid| gid.id}
    purchased_gifts = child.gift_accessions.where(:approved => true).pluck(:gift_id)
    ids = filtered_gifts - purchased_gifts
    return Gift.where(:id => ids)
  end
  
  def self.get_amazon_reviews(gift)
    unless gift.sku.blank?
      res = Amazon::Ecs.item_lookup(gift.sku, { :response_group => "ItemAttributes,Reviews"})
      res.items.first.get("CustomerReviews/IFrameURL")
    end
  end
  
end
