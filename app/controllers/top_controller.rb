class TopController < ApplicationController
  def index
    if session[:user_id]
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました。"
    end
  end
end
