class CreateUserChildCategoryPreferences < ActiveRecord::Migration
  def change
    create_table :user_child_category_preferences do |t|
      t.references :relationship
      t.references :gift_category
      t.timestamps
    end
    add_index :user_child_category_preferences, [:relationship_id, :gift_category_id]
  end
end
