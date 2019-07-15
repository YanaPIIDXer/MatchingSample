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

    # 大文字・小文字を区別させるにはカラムにBINARY属性を付ける必要があるが、
    # Railsの普通のやり方だとその術が無いらしい。
    # 仕方ないので自前でBINARY属性を付ける。
    # 参考資料：https://qiita.com/tobita0000/items/a6b09565f63b86b6dc41
    execute("alter table users modify user_id varchar(255) binary")
    execute("alter table users modify password varchar(255) binary")
  end
end
