class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, hmac_secret, 'HS256')
    end

    def user_payload(user)
        {user_id: user.id}
    end

    def hmac_secret
        ENV['JWT_SECRET_KEY']
    end

    def token
        request.headers['Authorization']
    end

    def  decoded_token
        JWT.decode(token, hmac_secret, true, {algorithm: "HS256"})
    end

    def logged_in_user
        User.find(decoded_token[0]['user_id'])
    end

end
