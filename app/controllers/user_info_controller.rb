class UserInfoController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    @user = User.find_by(user_id: params[:user_id])
    if !@user
      redirect_to error_path, :alert => "無効なユーザＩＤです。"
      return
    end

    @isSendContact = isSendContactRequest?(params[:user_id])
    @isContactUser = isContactUser?(params[:user_id])
  end

  def contact_request
    if checkAndRedirectToError()
      return
    end

    if !params[:user_id] || params[:user_id] == ""
      redirect_to error_path, :alert => "不正なリクエストです。"
      return
    end

    if isSendContactRequest?(params[:user_id])
      redirect_to user_info_path(:user_id => params[:user_id]), :alert => "コンタクト要求送信済みです。"
      return
    end

    if isContactUser?(params[:user_id])
      redirect_to user_info_path(:user_id => params[:user_id]), :alert => "コンタクト済みのユーザです。"
      return
    end

    req = ContactRequest.new(user_id: session[:user_id], target_user_id: params[:user_id])
    if !req.save()
      redirect_to user_info_path(:user_id => params[:user_id]), :alert => "コンタクト要求の送信に失敗しました。"
      return
    end

    redirect_to user_info_path(:user_id => params[:user_id]), :notice => "コンタクト要求を送信しました。"
  end

  def cancel_contact_request
    if checkAndRedirectToError()
      return
    end

    if !params[:user_id] || params[:user_id] == ""
      redirect_to error_path, :alert => "不正なリクエストです。"
      return
    end

    req = ContactRequest.find_by(user_id: session[:user_id], target_user_id: params[:user_id])

    if !req
      redirect_to user_info_path(:user_id => params[:user_id]), :alert => "コンタクト要求をしていません。"
      return
    end

    if !req.destroy()
      redirect_to user_info_path(:user_id => params[:user_id]), :alert => "コンタクト要求の解除に失敗しました。"
      return
    end

    redirect_to user_info_path(:user_id => params[:user_id]), :notice => "コンタクト要求を解除しました。"
  end

private

  def isSendContactRequest?(target_user_id)
    return (ContactRequest.find_by(user_id: session[:user_id], target_user_id: target_user_id) != nil)
  end

  def isContactUser?(target_user_id)
    users = Contact.collectUsers(session[:user_id])
    users.each do |user|
      return true if user.user_id == target_user_id
    end
    return false
  end

end
