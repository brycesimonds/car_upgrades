require 'rails_helper'

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "upgrades index page", type: :feature do 
    it 'can see the make name of each car record in the system' do 
        car_1 = Car.create!(make_name: "Toyota",
                            model_name: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(make_name: "Toyota",
                            model_name: "Camry",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        expect(page).to have_content(car_1.make_name)
        expect(page).to have_content(car_2.make_name)
    end


    it "can see all the upgrades car parts names, cost of part, and if needs a mechanic" do 
        upgrade_1 = Upgrade.create!(car_part_name: "Suspension",
                                    cost_of_part: 1200,
                                    need_mechanic: false)
        upgrade_2 = Upgrade.create!(car_part_name: "Engine Replacement",
                                    cost_of_part: 7000,
                                    need_mechanic: true)
        
        visit "/upgrades"

        expect(page).to have_content(upgrade_1.car_part_name)
        expect(page).to have_content("Cost of #{upgrade_1.car_part_name} parts is $#{upgrade_1.cost_of_part}")
        expect(page).to have_content("Does the upgrade need a mechanic? #{upgrade_1.need_mechanic}")
        expect(page).to have_content(upgrade_2.car_part_name)
        expect(page).to have_content("Cost of #{upgrade_2.car_part_name} parts is $#{upgrade_2.cost_of_part}")
        expect(page).to have_content("Does the upgrade need a mechanic? #{upgrade_2.need_mechanic}")                      
    end
end