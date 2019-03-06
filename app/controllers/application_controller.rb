class ApplicationController < ActionController::Base
    helper_method  :current_user, :current_user?

    def current_user?(userId)
        userId == current_user.id
     end

end
