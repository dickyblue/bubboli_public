class AddRelationTokenToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :relation_token, :string
    add_column :relationships, :relation_token_sent_at, :datetime
    
    add_index :relationships, :relation_token    
  end
end
