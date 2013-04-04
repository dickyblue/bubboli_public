class RelationType < ActiveRecord::Base

  attr_accessible :name, :relation_type_id
  
  has_many :relationships
  has_many :users, :through => :relationships
  has_many :children, :through => :relationships

end
