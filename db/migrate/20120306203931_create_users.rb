class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :first_name, :limit => 25
      t.string    :last_name, :limit => 50
      t.string    :email
      t.string    :work_email
      t.string    :password_salt
      t.string    :password_hash
      t.string    :password_reset_token
      t.datetime  :password_reset_sent_at
      t.string    :confirmation_token
      t.datetime  :confirmation_token_sent_at
      t.boolean   :confirmed, :null => false, :default => false
      t.string    :gender
      t.string    :address_street
      t.string    :address_apt
      t.string    :address_city
      t.string    :address_state
      t.integer   :address_zip
      t.string    :address_country
      t.boolean   :admin, :default => false

      t.timestamps
    end
    add_index :users, [:email, :work_email], :unique => true
  end
end