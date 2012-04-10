class RemoveAgeRangeFromGifts < ActiveRecord::Migration
  def up
    remove_column :gifts, :age_range
  end

  def down
    add_column :gifts, :age_range, :string
  end
end
