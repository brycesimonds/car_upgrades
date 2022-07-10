# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child


# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'can create a new upgrade for a specific car' do
    it 'has a clickable link new upgrade that brings the user to /cars/car_id/upgrades/new' do 
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
        
        visit "/cars/#{car_1.id}/upgrades"
    
        click_link('Create Upgrade')
       
        expect(current_path).to eq("/cars/#{car_1.id}/upgrades/new")
    end

    xit 'car edit a car' do 
        car_1 = Car.create!(brand_of_car: "Toyot",
            what_line_of_car: "4Run",
            year: 2009,
            is_used: false)

        visit "/cars/#{car_1.id}/edit"
        
        fill_in('Brand of car', with: "Toyota")
        fill_in('What line of car', with: "4Runner")
        fill_in('Year', with: 2005)
        fill_in('Is used', with: true)

        click_button("Edit #{car_1.brand_of_car}")

        expect(current_path).to eq("/cars/#{car_1.id}")
        expect(page).to have_content("Toyota")
        expect(page).to have_content("4Runner")
        expect(page).to have_content("2005")
        expect(page).to have_content("true")
    end

    xit 'displays a link at the top of the page that says Upgrades Index' do
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

    xit 'can click on the link and go to the Upgrades Index' do
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

    xit 'displays a link at the top of the page that says Cars Index' do
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

    xit 'can click on the link and go to the Cars Index' do
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

    xit 'displays a link at the top of the page that says go to this cars upgrades index' do
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

    xit 'can click on the link and go to the cars specific upgrade index' do
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