class AuthController < ApplicationController
    def login
        user = User.find_by(username: param[:username])
        is_authenticated = user.authenticate(params[:password])
        if is_authenticated
            render json: user
        end
    end
end
