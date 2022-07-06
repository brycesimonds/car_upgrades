require 'rails_helper'

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "upgrades index page", type: :feature do 
    it 'can see the make name of each car record in the system' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        # car_2 = Car.create!(car_make_name: "Toyota",
        #     car_type_name: "Camry",
        #     year: 2022,
        #     is_used: false)

        visit '/cars'

        expect(page).to have_content(car_1.make_name)
        expect(page).to have_content(car_2.make_name)
    end
end 