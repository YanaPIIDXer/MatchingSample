class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    redirect_to '/top', :notice => "登録しました。"
  end
end
