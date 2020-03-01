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

end
