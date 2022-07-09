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
                                    need_mechanic: false,
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
end