class AuthController < ApplicationController
    def login
        user = User.find_by(username: param[:username])
        is_authenticated = user.authenticate(params[:password])
    end
end
