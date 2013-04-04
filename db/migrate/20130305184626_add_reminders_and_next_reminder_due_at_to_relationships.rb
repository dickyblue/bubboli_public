class AddRemindersAndNextReminderDueAtToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :reminders, :text
    add_column :relationships, :next_reminder_due_at, :date
  end
end
