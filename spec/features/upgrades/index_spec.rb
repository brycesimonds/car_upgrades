require 'rails_helper'

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe "upgrades index page", type: :feature do 
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