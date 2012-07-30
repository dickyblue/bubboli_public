class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user
      t.references :child
      t.references :relation_type
      t.timestamps
    end
    add_index :relationships, [:user_id, :child_id, :relation_type_id]
  end
end
