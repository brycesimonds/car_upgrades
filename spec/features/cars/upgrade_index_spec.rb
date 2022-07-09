require 'rails_helper'

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

        expect(page).to have_content(car_1.upgrades[0].car_part_name)
        expect(page).to have_content(car_1.upgrades[0].cost_of_part)
        expect(page).to have_content(car_1.upgrades[0].need_mechanic)
        expect(page).to have_content(car_1.upgrades[1].car_part_name)
        expect(page).to have_content(car_1.upgrades[1].cost_of_part)
        expect(page).to have_content(car_1.upgrades[1].need_mechanic)
        expect(page).to_not have_content(car_2.upgrades[0].car_part_name)
        expect(page).to_not have_content(car_2.upgrades[0].cost_of_part)
        expect(page).to_not have_content(car_2.upgrades[1].car_part_name)
        expect(page).to_not have_content(car_2.upgrades[1].cost_of_part)
    end

    it 'displays a link at the top of the page that says Upgrades Index' do 
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

        within "#nav_links" do 
            expect(page).to have_content("Upgrades Index")
        end
    end

    it 'can click on the link and go to the Upgrades Index' do 
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

        click_link 'Upgrades Index'

        expect(current_path).to eq('/upgrades')
    end
end 