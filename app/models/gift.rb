class Gift < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender,
  :gift_category_ids, :gift_images_attributes, :gift_price_range_ids, :description, :why_bubboli_loves_it, :favorite, :gift_age_range_ids
  
  attr_searchable :name, :gender, :description
    
  validates :name, :permalink, :price, :merchant, :presence => true
  
  has_many  :gift_images 
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
  
  scope :recently_added, lambda { where("created_at <= ? AND created_at >= ?", Date.today, Date.today - 100) }
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
    result = self.where(:gender => [child.gender, "unisex"]).joins(:gift_age_classifications).merge(GiftAgeClassification.gift_by_age_range(child))
    result.joins(:gift_price_classifications).merge(GiftPriceClassification.user_child_price_pref(rel))
  end
  
  def self.gift_by_pref_all_cat(child, rel)
    self.get_gift_by_gender_age_price(child, rel).joins(:gift_categorizations).merge(GiftCategorization.gift_by_matching_cat(rel)).limit(10).uniq
  end
  
  
  
end
