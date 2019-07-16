class UserSearchController < ApplicationController
  def index
  end

  def result
    if params[:age_min].to_i() > params[:age_max].to_i()
      redirect_to "/user_search", :alert => "年齢の最小値が年齢の最大値を超えています。"
      return
    end
    
    @users = User.where("user_id <> ?", session[:user_id])

    if params[:name] != ""
      @users = @users.where("name like ?", "%#{params[:name]}%")
    end

    if params[:detail] != ""
      @users = @users.where("detail like ?", "%#{params[:detail]}%")
    end

    @users = @users.where("age >= ? and age <= ?", params[:age_min].to_i(), params[:age_max].to_i())
    
    @userCount = @users.length
  end
end
