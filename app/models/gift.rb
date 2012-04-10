class Gift < ActiveRecord::Base

  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender, :male, :female, :age_range, 
  :gift_category_ids, :gift_images_attributes, :price_search, :description, :why_bubboli_loves_it, :favorite, :gift_age_range_ids
  
  attr_searchable :name, :price_search, :age_range, :gender, :description
    
  validates :name, :permalink, :price, :merchant, :age_range, :presence => true
  
  has_many  :gift_images 
  has_many  :gift_categorizations
  has_many  :gift_categories, :through => :gift_categorizations
  has_many  :gift_age_classifications
  has_many  :gift_age_ranges, :through => :gift_age_classifications
  
  accepts_nested_attributes_for :gift_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
   
  def self.gender_search(gender)
    Gift.where(:gender => [gender, 'unisex'])
  end
  
  search_methods :gender_search

  
end
