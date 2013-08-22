class ChangeInvitations < ActiveRecord::Migration
  def up
    add_column :invitations, :relationship_id, :integer
  end

  def down
    remove_column :invitations, :relationship_id
  end
end
