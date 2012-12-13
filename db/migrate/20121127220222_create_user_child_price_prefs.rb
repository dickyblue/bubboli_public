class CreateUserChildPricePrefs < ActiveRecord::Migration
  def change
    create_table :user_child_price_prefs do |t|
      t.references  :relationship
      t.references  :gift_price_range
      t.timestamps
    end
    add_index :user_child_price_prefs, :relationship_id
    add_index :user_child_price_prefs, :gift_price_range_id    
    add_index :user_child_price_prefs, [:relationship_id, :gift_price_range_id], :name => 'user_child_price_pref'
  end
end
