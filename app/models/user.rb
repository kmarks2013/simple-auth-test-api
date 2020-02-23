class User < ApplicationRecord
    PASSWORD_FORMAT = /\A
        (?=.*\d)           # Must contain a digit
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*[A-Z])        # Must contain an upper case character
        (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
    # user validations
    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false
    validates :username, :length => { :in => 6..30 }
    
    # password validations
    has_secure_password
    validates :password, :length => { :minimum => 6 }
    validate :password_complexity

    def password_complexity
        return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

        errors.add :password, 'Password must include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end
    

end
