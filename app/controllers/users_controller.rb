class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:age] == ""
      redirect_to join_path, :alert => "年齢を正しく入力してください。"
      return
    end
    
    @user = User.new(user_id: params[:user][:user_id], password: params[:user][:password], name: params[:user][:name], age: params[:user][:age].to_i(), detail: params[:user][:detail])    
    if !@user.save
      redirect_to join_path, :alert => @user.errors.first[1]
      return
    end

    redirect_to root_path, :notice => "登録しました。"
  end
end
