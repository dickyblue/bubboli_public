class RemoveImageFromGifts < ActiveRecord::Migration
  def up
    remove_column :gifts, :image
  end

  def down
    add_column :gifts, :image, :string
  end
end
