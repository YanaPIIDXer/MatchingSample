class LogoutController < ApplicationController
  def logout
    session[:user_id] = nil
    redirect_to root_path, :notice => "ログアウトしました。"
  end
end
