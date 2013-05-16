class AddSendInvitationToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :send_invitation, :boolean
  end
end
