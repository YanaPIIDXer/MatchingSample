class UserSearchController < ApplicationController
  def index
  end

  def query
    users = User.where("user_id <> ?", session[:user_id]);
    
    session[:user_search_result] = users
    redirect_to '/user_search_result'
  end

  def result
    if !session[:user_search_result]
      redirect_to '/error', :alert => "エラーが発生しました"
      return
    end

    @users = session[:user_search_result]
    @userCount = @users.length
    session[:user_search_result] = nil
  end
end
