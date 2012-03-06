class Gift < ActiveRecord::Base

  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender, :age_range, 
  :gift_category_ids, :image, :remote_image_url, :price_search, :description, :why_bubboli_loves_it, :favorite
  
  scope :favorites, Gift.where(:favorite => true)
  search_methods :favorites

  attr_searchable :name, :price_search, :age_range, :gender, :description
   

    
  validates :name, :permalink, :price, :merchant, :gender, :age_range, :presence => true
    
  has_many :gift_categorizations
  has_many :gift_categories, :through => :gift_categorizations

  mount_uploader :image, GiftImageUploader
  
  
end
