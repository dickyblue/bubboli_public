class CreateGiftImages < ActiveRecord::Migration
  def change
    create_table :gift_images do |t|
      t.references  :gift  
      t.string      :image, :null => false  
      t.string      :image2
      t.string      :image3
      t.string      :image4
      t.timestamps
    end
    add_index :gift_images, :gift_id
  end
end
