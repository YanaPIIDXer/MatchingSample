class UserSearchController < ApplicationController
  def index
  end

  def result
    @users = User.where("user_id <> ?", session[:user_id])

    if params[:name] != ""
      @users = @users.where("name like ?", "%#{params[:name]}%")
    end
    
    @userCount = @users.length
  end
end
