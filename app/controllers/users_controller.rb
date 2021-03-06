class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            render json: {token: encode_token(user_payload(user))}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def profile
        render json: logged_in_user
    end

    private

    def user_params
        params.permit(:username, :password)
    end

    

end
