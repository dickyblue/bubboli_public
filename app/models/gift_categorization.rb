class GiftCategorization < ActiveRecord::Base

  attr_accessible :gift_category_id, :gift_id

  belongs_to :gift_category
  belongs_to :gift

end
