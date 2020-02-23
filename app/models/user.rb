class User < ApplicationRecord

    has_secure_password

    # user validations
    validates_presence_of :username
    validates_uniqueness_of :username, :case_sensitive => false
    validates :username, :length => { :in => 6..30}

end
