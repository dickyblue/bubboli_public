class AddPriceErrorToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :price_error, :boolean
    add_index :gifts, :price_error    
  end
end
