require 'rails_helper'

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

RSpec.describe "upgrades show page", type: :feature do 
    it 'shows the child(upgrade) matching the id in the path including its attributes' do 
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


        visit "/upgrades/#{upgrade_1.id}"

        expect(page).to have_content(upgrade_1.car_part_name)
        expect(page).to have_content("Cost of part: #{upgrade_1.cost_of_part}")
        expect(page).to have_content("Does it need a mechanic: #{upgrade_1.need_mechanic}")
        expect(page).to_not have_content(upgrade_2.car_part_name)
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


        visit "/upgrades/#{upgrade_1.id}"

        within "#nav_links" do 
            expect(page).to have_content("Upgrades Index")
        end
    end
end 