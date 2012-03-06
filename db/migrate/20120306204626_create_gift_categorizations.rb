class CreateGiftCategorizations < ActiveRecord::Migration
  def change
    create_table :gift_categorizations do |t|
      t.references :gift
      t.references :gift_category
      
      t.timestamps
    end
    add_index :gift_categorizations, [:gift_id, :gift_category_id]
    
  end
end
