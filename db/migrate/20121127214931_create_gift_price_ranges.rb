class CreateGiftPriceRanges < ActiveRecord::Migration
  def change
    create_table :gift_price_ranges do |t|
      t.string  :name
      t.timestamps
    end
  end
end
