class SessionsController < ApplicationController

    def create
        user = User.find_by_username(params[:username])
        if user.valid?
            session[:user_id] ||= user.id
            render json: user
        end
    end

    def destroy
        session.delete(:user_id)
        head :no_content
    end
end
