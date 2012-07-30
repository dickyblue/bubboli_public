class Child < ActiveRecord::Base
  
  attr_accessible :first_name, :gender, :birth_date, :relationships_attributes, :relation_type_ids
  
  validates :first_name, :gender, :birth_date, :presence => true

  has_many :relationships
  has_many :relation_types, :through => :relationships
  has_many :users, :through => :relationships
  
  accepts_nested_attributes_for :users
  
end