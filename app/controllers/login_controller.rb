class LoginController < ApplicationController
  def index
    if session[:user_id]
      redirect_to user_top_path
      return
    end
  end

  def check
    user_id = params[:session][:user_id]
    if user_id == ""
      redirect_to login_path, :alert => "ユーザ名を入力してください。"
      return
    end

    password = params[:session][:password]
    if password == ""
      redirect_to login_path, :alert => "パスワードを入力してください。"
      return
    end

    user = User.where("user_id = ? and password = ?", user_id, password)
    if user.empty?
      redirect_to login_path, :alert => "ログインに失敗しました。"
      return
    end

    session[:user_id] = user_id
    redirect_to user_top_path, :notice => "ログインしました。"
  end
end
