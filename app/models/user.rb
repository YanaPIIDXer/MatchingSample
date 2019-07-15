class User < ActiveRecord::Base

    validates :user_id, presence: { message: "ユーザＩＤを入力してください。" }
    validates :user_id, uniqueness: { message: "既に使用されているユーザＩＤです。" }

    validates :password, presence: { message: "パスワードを入力してください。" }

    validates :name, presence: { message: "ユーザ名を入力してください。" }
    
end
