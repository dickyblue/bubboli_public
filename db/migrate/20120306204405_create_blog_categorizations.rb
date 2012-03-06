class CreateBlogCategorizations < ActiveRecord::Migration
  def change
    create_table :blog_categorizations do |t|
      t.references :blog
      t.references :blog_category

      t.timestamps
    end
    add_index :blog_categorizations, [:blog_id, :blog_category_id]
  end
end
