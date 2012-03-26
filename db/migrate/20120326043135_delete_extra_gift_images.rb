class DeleteExtraGiftImages < ActiveRecord::Migration
  def up
    change_column :gift_images, :image, :string, :null => true
    remove_column :gift_images, :image2
    remove_column :gift_images, :image3
    remove_column :gift_images, :image4
  end

  def down
    add_column :gift_images, :image4, :string
    add_column :gift_images, :image3, :string
    add_column :gift_images, :image2, :string
    change_column :gift_images, :image, :string, :null => false
  end
end
