require 'rails_helper'

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

RSpec.describe "car upgrades index page", type: :feature do 
    it 'can see the upgrades that are associated with the car, along with each upgrades attributes' do 
        car_1 = Car.create!(id:1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(id:2,
                            brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)

        car_1.upgrades.create!(car_part_name: "Suspension",
                               cost_of_part: 1200,
                               need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
                               need_mechanic: true)
        car_2.upgrades.create!(car_part_name: "Wheels",
                               cost_of_part: 1300,
                               need_mechanic: true)
        car_2.upgrades.create!(car_part_name: "Tires",
                               cost_of_part: 300,
                               need_mechanic: true)
   
        visit "/cars/#{car_1.id}/upgrades"

        expect(page).to have_content(car_1.upgrades[0])
        expect(page).to have_content(car_1.upgrades[1])
        expect(page).to_not have_content(car_2.upgrades[0])
        expect(page).to_not have_content(car_2.upgrades[1])
    end
end 