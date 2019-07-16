class ContactRequestsController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    reqs = ContactRequest.where("target_user_id = ?", session[:user_id])
    @requests = []
    reqs.each do |req|
      user = User.find_by(user_id: req.user_id)
      if user
        @requests.push(user)
      end
    end
  end

  def create_contact
    if checkAndRedirectToError()
      return
    end

    if !params[:user_id] || !User.find_by(user_id: params[:user_id])
      redirect_to '/error', :alert => "不正なリクエストです。"
      return
    end

    Contact.transaction do
      ContactRequest.transaction do
        Contact.create!(user_id1: session[:user_id], user_id2: params[:user_id])
        req = ContactRequest.find_by(user_id: params[:user_id], target_user_id: session[:user_id])
        req.destroy!()
      end
    end

    redirect_to '/contact_requests', :notice => "コンタクト要求を受諾しました。"
  end
end
