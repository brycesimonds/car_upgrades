class Car < ApplicationRecord
    has_many :upgrades
    
    validates_presence_of :brand_of_car
    validates_presence_of :what_line_of_car
    validates_presence_of :year
    validates :is_used, inclusion: [true, false]

    def upgrade_count
        upgrades.count
    end

    def self.sort_created_at
        order(created_at: :desc)
    end
end

