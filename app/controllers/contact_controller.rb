class ContactController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end

    target = User.find_by(user_id: params[:user_id])
    if !target
      redirect_to '/error', :alert => "不正なアクセスです。"
      return
    end

    me = User.find_by(user_id: session[:user_id])
    contact = Contact.findContactId(me.user_id, target.user_id)
    if !contact
      redirect_to '/error', :alert => "無効なコンタクトです。"
      return
    end

    @contact_id = contact.contact_id
    msgs = ContactMessage.where("contact_id = ?", @contact_id)
    @messages = []
    msgs.each do |msg|
      data = nil
      if msg.user_id == me.user_id
        data = ContactHelper::MessageData.new(me.name, msg.message, true)
      else
        data = ContactHelper::MessageData.new(target.name, msg.message, false)
      end
      @messages.push(data)

      if msg.user_id != me.user_id && !msg.is_read
        msg.is_read = true
        msg.save()
      end
    end
  end

  def send_message
    if !params[:message] || params[:message] == ""
      redirect_to "/contact?user_id=#{params[:user_id]}", :alert => "何も書かれていません。"
      return
    end

    message = ContactMessage.new(contact_id: params[:contact_id], user_id: session[:user_id], message: params[:message])
    if !message.save()
      redirect_to "/contact?user_id=#{params[:user_id]}", :alert => "発言に失敗しました。"
      return
    end
    
    redirect_to "/contact?user_id=#{params[:user_id]}"
  end
end
