class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string    :title
      t.text      :content
      t.boolean   :published, :default => false
      t.string    :author
      t.string    :author_permalink
      t.datetime  :publish_date

      t.timestamps
    end
  end
end
