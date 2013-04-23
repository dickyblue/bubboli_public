class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :blogs, :slug, :string
    add_column :gifts, :slug, :string
    add_column :relationships, :slug, :string
    add_column :users, :slug, :string
    
    add_index :blogs, :slug
    add_index :gifts, :slug
    add_index :relationships, :slug
    add_index :users, :slug
  end
end
