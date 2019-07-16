class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.integer :contact_id
      t.string :user_id
      t.string :message
      t.boolean :is_read, default: false

      t.timestamps null: false
    end
  end
end
