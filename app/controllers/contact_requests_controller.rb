class ContactRequestsController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    reqs = ContactRequest.where("target_user_id = ?", session[:user_id])
    @requests = []
    reqs.each do |req|
      user = User.find_by(user_id: req.target_user_id)
      if user
        @requests.push(user)
      end
    end
  end
end
