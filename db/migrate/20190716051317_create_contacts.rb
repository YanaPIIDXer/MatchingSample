class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :user_id1
      t.string :user_id2

      t.timestamps null: false
    end
  end
end
