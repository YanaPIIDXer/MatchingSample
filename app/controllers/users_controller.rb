class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_id: params[:user][:user_id], password: params[:user][:password], name: params[:user][:name], detail: params[:user][:detail])
    if !@user.save
      redirect_to '/join', :alert => @user.errors.first[1]
      return
    end

    redirect_to '/top', :notice => "登録しました。"
  end
end
