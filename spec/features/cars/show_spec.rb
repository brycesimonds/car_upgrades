require 'rails_helper'

RSpec.describe "cars show page", type: :feature do 
    it 'shows the parent(cars) matching the id in the path including its attributes' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
            what_line_of_car: "Taurus",
            year: 2022,
            is_used: false)

        visit "/cars/#{car_1.id}"

        expect(page).to have_content(car_1.brand_of_car)
        expect(page).to have_content("Model: #{car_1.what_line_of_car}")
        expect(page).to have_content("Year: #{car_1.year}")
        expect(page).to have_content("Is it used?: #{car_1.is_used}")
        expect(page).to_not have_content(car_2.brand_of_car)
    end

    it 'shows the count of the number of upgrades associated with this car' do
        Upgrade.destroy_all
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)

    
        car_1.upgrades.create!(car_part_name: "Suspension",
                               cost_of_part: 1200,
                               need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
                               need_mechanic: true)
        
        visit "/cars/#{car_1.id}"

        expect(page).to have_content("This car has #{car_1.upgrade_count} upgrades")
    end

    it 'displays a link at the top of the page that says Upgrades Index' do
        Upgrade.destroy_all
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

    
        car_1.upgrades.create!(car_part_name: "Suspension",
                               cost_of_part: 1200,
                               need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
                               need_mechanic: true)
        
        visit "/cars/#{car_1.id}"

        within "#nav_links" do 
            expect(page).to have_content("Upgrades Index")
        end
    end
end 