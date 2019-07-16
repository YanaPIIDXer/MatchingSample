class CreateContactUsers < ActiveRecord::Migration
  def change
    create_table :contact_users do |t|
      t.integer :contact_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
