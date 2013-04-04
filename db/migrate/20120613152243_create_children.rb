class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.date :birth_date
      t.string :gender
      t.timestamps
    end
  end
end
