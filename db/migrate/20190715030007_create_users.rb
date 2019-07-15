class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password
      t.string :name
      t.integer :age
      t.string :detail

      t.timestamps null: false
    end
  end
end
