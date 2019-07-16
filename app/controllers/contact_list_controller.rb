class ContactListController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    @contactUsers = Contact.collectUsers(session[:user_id])
  end
end
