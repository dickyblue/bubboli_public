class CreateGiftAgeClassifications < ActiveRecord::Migration
  def change
    create_table :gift_age_classifications do |t|
      t.references :gift
      t.references :gift_age_range

      t.timestamps
    end
    add_index :gift_age_classifications, [:gift_id, :gift_age_range_id]
  end
end
