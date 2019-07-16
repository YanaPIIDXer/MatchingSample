class ContactListController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    contactUsers = Contact.collectUsers(session[:user_id])
    @users = []
    contactUsers.each do |user|
      contact = Contact.findContactId(session[:user_id], user.user_id)
      has_not_read = Contact.hasNotRead?(contact.contact_id, session[:user_id])
      
      data = ContactListHelper::ContactListData.new(user.user_id, user.name, has_not_read)
      @users.push(data)
    end
  end
end
