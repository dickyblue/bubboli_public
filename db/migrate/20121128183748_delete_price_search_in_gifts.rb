class DeletePriceSearchInGifts < ActiveRecord::Migration
  def up
    remove_column :gifts, :price_search
  end

  def down
    add_column  :gifts, :price_search
  end
end
