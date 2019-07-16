class UserSearchController < ApplicationController
  def index
  end

  def result
    @users = User.where("user_id <> ?", session[:user_id])
    @userCount = @users.length
  end
end
