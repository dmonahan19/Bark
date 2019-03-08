class ApplicationController < ActionController::Base
    helper_method  :current_user?

    def current_user?(userId)
        return userId == current_user.id if current_user 
        false
     end


end
