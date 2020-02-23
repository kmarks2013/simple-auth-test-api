class User < ApplicationRecord
    
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
