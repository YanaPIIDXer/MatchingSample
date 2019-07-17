class AuthPageController < ApplicationController
    
protected

    def checkAndRedirectToError
        if !session[:user_id]
            redirect_to error_path, :alert => "ログインしてください。"
            return true
        end
        return false
    end
    
end