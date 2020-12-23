class Sneaker < ActiveRecord::Base
    belongs_to :user

    validates :brand
    validates :model
    validates :size
    validates :price
    validates :sport
end
