class UserChildCatPref < ActiveRecord::Base

  belongs_to :relationship
  belongs_to :gift_category
  
end
