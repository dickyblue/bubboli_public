class AddBabyShowerAndIndexToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :baby_shower, :boolean
    add_index :gifts, :favorite
  end
end
