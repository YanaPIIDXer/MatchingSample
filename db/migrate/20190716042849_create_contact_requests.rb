class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :user_id
      t.string :target_user_id

      t.timestamps null: false
    end
  end
end
