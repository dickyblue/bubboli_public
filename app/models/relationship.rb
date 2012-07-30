class Relationship < ActiveRecord::Base

  attr_accessible :user_id, :child_id, :relation_type_id

  belongs_to :user
  belongs_to :child
  belongs_to :relation_type
  

end
