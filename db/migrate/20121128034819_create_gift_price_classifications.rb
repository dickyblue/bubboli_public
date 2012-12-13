class CreateGiftPriceClassifications < ActiveRecord::Migration
  def change
    create_table :gift_price_classifications do |t|
      t.references :gift
      t.references :gift_price_range

      t.timestamps
    end
    add_index :gift_price_classifications, :gift_id
    add_index :gift_price_classifications, :gift_price_range_id
    add_index :gift_price_classifications, [:gift_id, :gift_price_range_id], :name => 'gift_price_classification'
  end
end
