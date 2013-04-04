class CreateGiftAccessions < ActiveRecord::Migration
  def change
    create_table :gift_accessions do |t|
      t.references    :gift
      t.references    :child
      t.references    :user
      t.boolean       :approved, :default => false
      t.timestamps
    end
    add_index :gift_accessions, :child_id 
    add_index :gift_accessions, :user_id 
  end
end
