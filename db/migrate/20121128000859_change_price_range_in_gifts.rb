class ChangePriceRangeInGifts < ActiveRecord::Migration
  def up
    rename_column :gift, :price_search, :gift_price_range_id
    change_column :gift, :gift_price_range_id, :integer
  end

  def down
    change_column :gift, :gift_price_range_id, :string
    rename_column :gift, :gift_price_range_id, :price_search  
  end
end
