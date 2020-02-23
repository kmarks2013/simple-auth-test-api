class User < ApplicationRecord
    
    # user validations
    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false
    validates :username, :length => { :in => 6..30}
    
    # password validations
    has_secure_password
    validates :password, :length => { :minimum => 6 }


end
