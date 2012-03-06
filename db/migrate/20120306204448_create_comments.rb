class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references  :blog
      t.text        :content
      t.string      :commenter
      t.string      :commenter_email
      t.string      :commenter_permalink
      t.string      :status

      t.timestamps
    end
    add_index :comments, :blog_id
  end
end
