class CreateReminderOptions < ActiveRecord::Migration
  def change
    create_table :reminder_options do |t|
      t.string  :name
      t.integer :days
      
      t.timestamps
    end
  end
end
