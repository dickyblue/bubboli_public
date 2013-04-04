class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references  :user
      t.references  :child
      t.references  :relation_type
      t.string      :status, :default => "Pending"
      t.datetime    :accepted_at
      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :child_id
    add_index :relationships, :relation_type_id    
    add_index :relationships, [:user_id, :child_id, :relation_type_id], :name => "user_child_relationship_idx"
  end
end
