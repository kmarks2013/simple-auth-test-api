class User < ApplicationRecord

    has_secure_password

    # user validations
    validates_presence_of :username
    
end
