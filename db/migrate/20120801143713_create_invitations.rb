class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer   :sender_id
      t.integer   :child_id
      t.string    :recipient_email
      t.string    :invitation_token
      t.datetime  :sent_at

      t.timestamps
    end
    add_index :invitations, :sender_id
    add_index :invitations, :child_id
    add_index :invitations, [:sender_id, :child_id]
  end
end
