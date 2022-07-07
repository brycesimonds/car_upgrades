class Car < ApplicationRecord
    has_many :upgrades
    validates_presence_of :brand_of_car
end