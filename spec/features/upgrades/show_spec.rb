require 'rails_helper'

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


        visit "/upgrades/#{upgrade_1.id}"

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


        visit "/upgrades/#{upgrade_1.id}"

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


        visit "/upgrades/#{upgrade_1.id}"

        click_link 'Cars Index'

        expect(current_path).to eq('/cars')
    end

    it 'displays a link on the page that says Update Upgrade and will redirect to /upgrades/:upgrade_id/edit' do 

        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = car_1.upgrades.create!(car_part_name: "Suspension",
                                           cost_of_part: 1200,
                                           need_mechanic: false,)
        upgrade_2 = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                           cost_of_part: 7000,
                                           need_mechanic: true,)

        visit "/upgrades/#{upgrade_1.id}"

        within "#nav_links" do 
            expect(page).to have_link("Update Upgrade")
        end
        
        click_link 'Update Upgrade'

        expect(current_path).to eq("/upgrades/#{upgrade_1.id}/edit")
    end 

    it 'has a link to delete the upgrade' do 

        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = car_1.upgrades.create!(car_part_name: "Suspension",
                                           cost_of_part: 1200,
                                           need_mechanic: false,)
        upgrade_2 = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                           cost_of_part: 7000,
                                           need_mechanic: true,)

        visit "/upgrades/#{upgrade_1.id}"

        within "#nav_links" do 
            expect(page).to have_link("Delete Record Of This #{upgrade_1.car_part_name}")
        end
    end 

    it 'has a link to delete the upgrade' do 

        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)

        upgrade_1 = car_1.upgrades.create!(car_part_name: "Suspension",
                                           cost_of_part: 1200,
                                           need_mechanic: false,)
        upgrade_2 = car_1.upgrades.create!(car_part_name: "Engine Replacement",
                                           cost_of_part: 7000,
                                           need_mechanic: true,)

        visit "/upgrades/#{upgrade_1.id}"
        
        click_on "Delete Record Of This #{upgrade_1.car_part_name}"

        expect(current_path).to eq('/upgrades')
        expect(page).to_not have_content("Suspension")
    end 
end 