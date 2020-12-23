class User < ActiveRecord::Base
    has_secure_password
    has_many :sneakers
    validates :username, presence: true
    validates :username, uniqueness: true
end