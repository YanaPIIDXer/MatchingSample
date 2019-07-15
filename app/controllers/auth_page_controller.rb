class AuthPageController < ApplicationController
    
protected

    def checkAndRedirectToError
        if !session[:user_id]
            redirect_to '/error', :alert => "ログインしてください。"
            return true
        end
        return false
    end
    
end