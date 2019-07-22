class User < ActiveRecord::Base

    has_secure_password

    validates :user_id, presence: { message: "ユーザＩＤを入力してください。" }
    validates :user_id, uniqueness: { message: "既に使用されているユーザＩＤです。" }

    validates :password_digest, presence: { message: "パスワードを入力してください。" }

    validates :name, presence: { message: "ユーザ名を入力してください。" }

    validates :age, inclusion: { in: 0..100, message: "年齢は０歳～１００歳の範囲でなければなりません。" }
end
