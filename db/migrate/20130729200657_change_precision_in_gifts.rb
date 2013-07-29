class ChangePrecisionInGifts < ActiveRecord::Migration
  def change
    change_column :gifts, :price, :decimal, :precision => 7, :scale => 2
  end
end
