require 'rails_helper'

RSpec.describe "upgrades index page", type: :feature do 
    it "can see all the upgrades car parts names, cost of part, and if needs a mechanic" do 

        car_1 = Car.create!(id: 1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: true,
                                    car_id: 1)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true,
                                    car_id: 1)
        
        visit "/upgrades"

        expect(page).to have_content(upgrade_1.car_part_name)
        expect(page).to have_content("Cost of #{upgrade_1.car_part_name} parts is $#{upgrade_1.cost_of_part}")
        expect(page).to have_content("Does the upgrade need a mechanic? #{upgrade_1.need_mechanic}")
        expect(page).to have_content(upgrade_2.car_part_name)
        expect(page).to have_content("Cost of #{upgrade_2.car_part_name} parts is $#{upgrade_2.cost_of_part}")
        expect(page).to have_content("Does the upgrade need a mechanic? #{upgrade_2.need_mechanic}")                      
    end

    it 'displays a link at the top of the page that says Upgrades Index' do 
        car_1 = Car.create!(id: 1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: false,
                                    car_id: 1)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true,
                                    car_id: 1)

        visit "/upgrades"

        within "#nav_links" do 
            expect(page).to have_content("Upgrades Index")
        end
    end 

    it 'can click on the link and go to the Upgrades Index' do 
        car_1 = Car.create!(id: 1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: false,
                                    car_id: 1)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true,
                                    car_id: 1)

        visit "/upgrades"

        click_link 'Upgrades Index'

        expect(current_path).to eq('/upgrades')
    end 

    it 'displays a link at the top of the page that says Cars Index' do 
        car_1 = Car.create!(id: 1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: false,
                                    car_id: 1)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true,
                                    car_id: 1)

        visit "/upgrades"

        within "#nav_links" do 
            expect(page).to have_content("Cars Index")
        end
    end 

    it 'can click on the link and go to the Cars Index' do 
        car_1 = Car.create!(id: 1,
                            brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: false,
                                    car_id: 1)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true,
                                    car_id: 1)

        visit "/upgrades"

        click_link 'Cars Index'

        expect(current_path).to eq('/cars')
    end 

    it 'shows only true records on the child index page' do

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

        expect(page).to have_content("Engine Replacement")
        expect(page).to have_content("7000")
        expect(page).to have_content("Battery")
        expect(page).to have_content("8000")

        expect(page).to_not have_content("Suspension")
        expect(page).to_not have_content("Wheels")
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

        visit '/upgrades'
  
        expect(page).to have_link("Click Here To Edit This #{upgrade_2.car_part_name}")
        expect(page).to have_link("Click Here To Edit This #{upgrade_4.car_part_name}")
    end

    it 'after clicking edit next to parent, taken to parent edit page' do 
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

    it 'has an delete link next to every upgrade' do 
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
 
        expect(page).to have_link("Click Here To Delete This #{upgrade_2.car_part_name}")
    end

    it 'after clicking delete next to upgrade, taken to upgrade index page' do 
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
        
        click_link "Click Here To Delete This Engine Replacement"

        expect(current_path).to eq("/upgrades")
        expect(page).to_not have_content("Engine Replacement")
    end
end