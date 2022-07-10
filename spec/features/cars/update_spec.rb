# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe '' do
    it 'has a clickable link new car that brings the user to /cars/car_id/edit' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        
        visit "/cars/#{car_1.id}"

        click_link("Update #{car_1.brand_of_car}")
       
        expect(current_path).to eq("/cars/#{car_1.id}/edit")
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
    it 'can click on the link and go to the Upgrades Index' do
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

        click_link 'Upgrades Index'

        expect(current_path).to eq('/upgrades')
    end

    it 'displays a link at the top of the page that says Cars Index' do
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
            expect(page).to have_content("Cars Index")
        end
    end
    it 'can click on the link and go to the Cars Index' do
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

        click_link 'Cars Index'

        expect(current_path).to eq('/cars')
    end

    it 'displays a link at the top of the page that says go to this cars upgrades index' do
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
            expect(page).to have_content("This cars upgrades index")
        end
    end

    it 'can click on the link and go to the cars specific upgrade index' do
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
        
        click_link 'This cars upgrades index'

        expect(current_path).to eq("/cars/#{car_1.id}/upgrades")
    end
end