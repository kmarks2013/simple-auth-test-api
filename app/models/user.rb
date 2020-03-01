class User < ApplicationRecord

    # user validations
    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false
    validates :username, :length => { :in => 6..30 }
    
    # password validations
    PASSWORD_FORMAT = /\A
        (?=.*[A-Z])        # Must contain an upper case character
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*\d)           # Must contain a digit
        (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
    has_secure_password
    validates :password, :length => { :minimum => 6 }
    validates :password, format: { with: PASSWORD_FORMAT, :message => 'Password must include: 1 uppercase, 1 lowercase, 1 digit and 1 special character' }

end
