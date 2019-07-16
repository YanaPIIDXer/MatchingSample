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

  def contact_request
    if checkAndRedirectToError()
      return
    end

    if !params[:user_id] || params[:user_id] == ""
      redirect_to '/error', :alert => "不正なリクエストです。"
      return
    end

    if ContactRequest.find_by(user_id: session[:user_id], target_user_id: params[:user_id])
      redirect_to "/user_info?user_id=#{params[:user_id]}", :alert => "コンタクト要求送信済みです。"
      return
    end

    req = ContactRequest.new(user_id: session[:user_id], target_user_id: params[:user_id])
    if !req.save()
      redirect_to "/user_info?user_id=#{oarans[:user_id]}", :alert => "コンタクト要求の送信に失敗しました。"
      return
    end

    redirect_to "/user_info?user_id=#{params[:user_id]}", :notice => "コンタクト要求を送信しました。"
  end

end
