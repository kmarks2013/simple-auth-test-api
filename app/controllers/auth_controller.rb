class AuthController < ApplicationController
    def login
        user = User.find_by(username: param[:username])
    end
end
