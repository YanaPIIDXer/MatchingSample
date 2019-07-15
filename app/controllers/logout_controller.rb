class LogoutController < ApplicationController
  def index
    session[:user_id] = nil
    redirect_to '/', :notice => "ログアウトしました。"
  end
end
