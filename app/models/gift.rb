class Gift < ActiveRecord::Base

  attr_accessible :name, :permalink, :available, :sku, :manufacturer, :price, :merchant, :gender, :male, :female, :age_range, 
  :gift_category_ids, :image, :image2, :image3, :image4, :image5, :remote_image_url, :price_search, :description, :why_bubboli_loves_it, :favorite
  

  attr_searchable :name, :price_search, :age_range, :gender, :description
    
  validates :name, :permalink, :price, :merchant, :age_range, :presence => true
    
  has_many :gift_categorizations
  has_many :gift_categories, :through => :gift_categorizations

  mount_uploader :image, GiftImageUploader
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
   
  def self.gender_search(gender)
    Gift.where(:gender => [gender, 'unisex'])
  end
  
  search_methods :gender_search
  
end
