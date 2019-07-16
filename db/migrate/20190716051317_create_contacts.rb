class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :user_id
      t.string :target_user_id

      t.timestamps null: false
    end
  end
end
