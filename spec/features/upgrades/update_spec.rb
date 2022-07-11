# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe "upgrades update page", type: :feature do 
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

   xit 'can click on the link and see a form to fill in and edit the Upgrade' do 
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


        visit "/upgrades/#{upgrade_1.id}/edit"

        fill_in('Car part name', with: "Suspension")
        fill_in('Cost of part', with: 2000)
        fill_in('Need mechanic', with: true)

        click_button("Create Upgrade")

        expect(current_path).to eq("/cars/#{car_1.id}/upgrades")
        expect(page).to have_content("Suspension")
        expect(page).to have_content("2000")
        expect(page).to have_content("true")
    end

    xit 'displays a link at the top of the page that says Upgrades Index' do 
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

    xit 'can click on the link and go to the Upgrades Index' do 
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


    xit 'displays a link at the top of the page that says Cars Index' do 
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

    xit 'can click on the link and go to the Cars Index' do 
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
end 