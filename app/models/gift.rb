class Gift < ActiveRecord::Base

  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender,
  :gift_category_ids, :gift_images_attributes, :price_search, :description, :why_bubboli_loves_it, :favorite, :gift_age_range_ids
  
  attr_searchable :name, :price_search, :gender, :description
    
  validates :name, :permalink, :price, :merchant, :presence => true
  
  has_many  :gift_images 
  has_many  :gift_categorizations
  has_many  :gift_categories, :through => :gift_categorizations
  has_many  :gift_age_classifications
  has_many  :gift_age_ranges, :through => :gift_age_classifications  
  has_many  :user_child_price_prefs
  has_many  :relationships, :through => :user_child_price_prefs
  
  accepts_nested_attributes_for :gift_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
   
  def self.gender_search(gender)
    Gift.where(:gender => [gender, 'Unisex'])
  end
  
  search_methods :gender_search

  def self.gift_by_gender(ch)
    self.where(:gender => [ch.gender, "Unisex"]).map {|p| p.name }
  end
  
  def age(ch)
    age = ((ch.birth_date.month - Date.today.month) + 12*(Date.today.year - ch.birth_date.year))/12
  end
  
  def self.get_gift_by_gender_and_age(child)
    self.where(:gender => [child.gender, "unisex"]).joins(:gift_age_classifications).merge(GiftAgeClassification.gift_by_age_range(child))
  end
  
  
end
