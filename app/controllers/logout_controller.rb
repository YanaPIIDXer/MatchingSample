class LogoutController < ApplicationController
  def logout
    session[:user_id] = nil
    redirect_to '/', :notice => "ログアウトしました。"
  end
end
