class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:errors] = "Sorry, either username or password is incorrect."
            redirect_to login_path
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to welcome_path
    end
end