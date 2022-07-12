require 'rails_helper'

RSpec.describe 'cars upgrades index', type: :feature do 
    it 'shows all the upgrades for the specific car' do
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        suspension = car_1.upgrades.create!(car_part_name: "Suspension",
                                            cost_of_part: 1200,
                                            need_mechanic: false)
        engine_replace = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                                cost_of_part: 7000,
                                                need_mechanic: true)

        visit "/cars/#{car_1.id}/upgrades"

        expect(page).to have_content(suspension.car_part_name)
        expect(page).to have_content(engine_replace.car_part_name)
    end

    it 'shows the upgrades attributes for the specific car' do 
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

        suspension = car_1.upgrades.create!(car_part_name: "Suspension",
                                            cost_of_part: 1200,
                                            need_mechanic: false)
        engine_replace = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                                cost_of_part: 7000,
                                                need_mechanic: true)
        wheels = car_2.upgrades.create!(car_part_name: "Wheels",
                                        cost_of_part: 1300,
                                        need_mechanic: true)
        tires = car_2.upgrades.create!(car_part_name: "Tires",
                                       cost_of_part: 300,
                                       need_mechanic: true)

        visit "/cars/#{car_1.id}/upgrades"

        expect(page).to have_content(suspension.car_part_name)
        expect(page).to have_content(suspension.cost_of_part)
        expect(page).to have_content(suspension.need_mechanic)
        expect(page).to have_content(engine_replace.car_part_name)
        expect(page).to have_content(engine_replace.cost_of_part)
        expect(page).to have_content(engine_replace.need_mechanic)
        expect(page).to_not have_content(wheels.car_part_name)
        expect(page).to_not have_content(tires.car_part_name)
    end

    it 'displays a link at the top of the page that says Upgrades Index' do 
        car_1 = Car.create!(id:1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        car_1.upgrades.create!(car_part_name: "Suspension",
                              cost_of_part: 1200,
                              need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
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

        car_1.upgrades.create!(car_part_name: "Suspension",
                               cost_of_part: 1200,
                               need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
                               need_mechanic: true)

        visit "/cars/#{car_1.id}/upgrades"

        click_link 'Upgrades Index'

        expect(current_path).to eq('/upgrades')
    end
    
    it 'displays a link at the top of the page that says Cars Index' do 
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
            expect(page).to have_content("Cars Index")
        end
    end

    it 'can click on the link and go to the Cars Index' do 
        car_1 = Car.create!(id:1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        car_1.upgrades.create!(car_part_name: "Suspension",
                              cost_of_part: 1200,
                              need_mechanic: false)
        car_1.upgrades.create!(car_part_name: "Engine Replacement",
                               cost_of_part: 7000,
                               need_mechanic: true)

        visit "/cars/#{car_1.id}/upgrades"

        click_link 'Cars Index'

        expect(current_path).to eq('/cars')
    end

    it 'displays a link at the top of the page that says Sort Alphabetically' do 
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
            expect(page).to have_content("Sort Alphabetically")
        end
    end

    it 'has an edit link next to every upgrade' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = car_1.upgrades.create!(car_part_name: "Suspension",
                                           cost_of_part: 1200,
                                           need_mechanic: false)
        upgrade_2 = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                           cost_of_part: 7000,
                                           need_mechanic: true)
        upgrade_3 = car_1.upgrades.create!(car_part_name: "Wheels",
                                           cost_of_part: 1100,
                                           need_mechanic: false)
        upgrade_4 = car_1.upgrades.create!(car_part_name: "Battery",
                                           cost_of_part: 8000,
                                           need_mechanic: true)

        visit "/cars/#{car_1.id}/upgrades"
  
        expect(page).to have_link("Click Here To Edit This #{upgrade_2.car_part_name}")
        expect(page).to have_link("Click Here To Edit This #{upgrade_4.car_part_name}")
    end

    xit 'after clicking edit next to parent, taken to parent edit page' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = car_1.upgrades.create!(car_part_name: "Suspension",
                                           cost_of_part: 1200,
                                           need_mechanic: false)
        upgrade_2 = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                           cost_of_part: 7000,
                                           need_mechanic: true)
        upgrade_3 = car_1.upgrades.create!(car_part_name: "Wheels",
                                           cost_of_part: 1100,
                                           need_mechanic: false)
        upgrade_4 = car_1.upgrades.create!(car_part_name: "Battery",
                                           cost_of_part: 8000,
                                           need_mechanic: true)

        visit '/upgrades'
        
        click_link "Click Here To Edit This Engine Replacement"

        expect(current_path).to eq("/upgrades/#{upgrade_2.id}/edit")
    end
end 





