class CreateChildImages < ActiveRecord::Migration
  def change
    create_table :child_images do |t|
      t.references  :child        
      t.string      :image
      t.boolean     :profile  
      t.timestamps
    end
    add_index :child_images, :child_id
  end
end
