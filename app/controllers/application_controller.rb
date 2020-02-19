class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized?
        unless current_user.id == params[:id].to_i
            flash[:errors] = "You're not permitted"
            redirect_to welcome_path
        end
    end
end
