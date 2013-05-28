class AddSlugToChildren < ActiveRecord::Migration
  def change
    add_column :children, :slug, :string
    
    add_index :children, :slug    
  end
end
