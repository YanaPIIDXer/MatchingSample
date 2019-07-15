class UserTopController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    user = User.find_by(user_id: session[:user_id])
    @name = user.name
  end
end
