class CreateUserChildCatPrefs < ActiveRecord::Migration
  def change
    create_table :user_child_cat_prefs do |t|
      t.references :relationship
      t.references :gift_category
      t.timestamps
    end
    add_index :user_child_cat_prefs, [:relationship_id, :gift_category_id], :name => 'user_child_cat_pref'    
  end
end
