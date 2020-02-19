class UsersController < ApplicationController
    before_action :authorized?, only: [:show]

    def new
        @user = User.new
    end

    def create
        user = User.new(strong_params)
        if user.save
            session[:user_id] = user.id
            user.update(cash: 5000)
            redirect_to user_path(user)
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        @user = current_user
    end
    
    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        user = User.find_by_id(params[:id])
        if user.update(strong_params)
            redirect_to user_path(user)
        else
            flash[:errors] = user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def history
        @user = current_user
        @races = current_user.races 
    end

    private

    def strong_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end