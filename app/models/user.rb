class User < ActiveRecord::Base
    has_secure_password
    has_many :sneakers
    validates :username, presence: true { case_sensitive: false }
    validates :username, uniqueness: true { case_sensitive: false }
end