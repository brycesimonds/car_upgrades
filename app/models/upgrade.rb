class Upgrade < ApplicationRecord
    belongs_to :car 

    validates_presence_of :car_part_name
    validates_presence_of :cost_of_part
    validates :need_mechanic, inclusion: [true, false]
    validates :cost_of_part, :numericality => {:only_integer => true}
end