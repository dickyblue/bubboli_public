class CreateGiftAgeRanges < ActiveRecord::Migration
  def change
    create_table :gift_age_ranges do |t|
      t.string  :name

      t.timestamps
    end
  end
end
