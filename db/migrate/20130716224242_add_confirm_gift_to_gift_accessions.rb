class AddConfirmGiftToGiftAccessions < ActiveRecord::Migration
  add_column :gift_accessions, :gift_accession_token, :string
  add_column :gift_accessions, :gift_accession_token_sent_at, :datetime
  
  add_index :gift_accessions, :gift_accession_token    
end
