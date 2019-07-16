class ContactRequestsController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end
  end
end
