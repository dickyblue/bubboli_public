class AddShowerAndCreatedAtIndexToGifts < ActiveRecord::Migration
  def change
    add_index :gifts, :baby_shower
    add_index :gifts, :created_at  
  end
end
