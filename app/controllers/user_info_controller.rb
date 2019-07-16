class UserInfoController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    @user = User.find_by(user_id: params[:user_id])
    if !@user
      redirect_to '/error', :alert => "無効なユーザＩＤです。"
      return
    end

    @prevPageURL = request.referer
  end
end
