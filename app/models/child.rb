class Child < ActiveRecord::Base
  
  attr_accessible :first_name, :gender, :birth_date
  
  validates :first_name, :gender, :birth_date, :presence => true
  
  has_many :users
  
end