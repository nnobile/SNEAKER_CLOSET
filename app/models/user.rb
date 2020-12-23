class User < ActiveRecord::Base
    has_secure_password
    has_many :sneakers

    #validates :username, presence: true, uniqueness: true { case_sensitive: false }
    #validates :password
end