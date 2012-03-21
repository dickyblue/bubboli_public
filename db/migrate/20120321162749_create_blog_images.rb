class CreateBlogImages < ActiveRecord::Migration
    def change
      create_table :blog_images do |t|
        t.references  :blog  
        t.string      :image, :null => false  
        t.string      :image2
        t.string      :image3
        t.string      :image4
        t.timestamps
      end
      add_index :blog_images, :blog_id
    end
  end
