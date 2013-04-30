class AddAlerts < ActiveRecord::Migration
  
  def change
    add_column :relationships, :friend_alert, :boolean
    add_column :gift_accessions, :gift_alert, :boolean
  end

end
