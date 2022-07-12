require 'rails_helper'

RSpec.describe "upgrades index page", type: :feature do 
    it 'can see the make name of each car record in the system' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
            what_line_of_car: "Taurus",
            year: 2022,
            is_used: false)

        visit "/cars"
        
        expect(page).to have_content(car_1.brand_of_car)
        expect(page).to have_content(car_2.brand_of_car)
    end

    it 'sorts the records in order by most recently created' do
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
            what_line_of_car: "Taurus",
            year: 2022,
            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
            what_line_of_car: "Sorento",
            year: 2013,
            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
            what_line_of_car: "R1T",
            year: 2022,
            is_used: false)

        visit '/cars'
            
        within "#car-0" do 
            expect(page).to have_content("Rivian")
        end

        within "#car-1" do 
            expect(page).to have_content("Kia")
        end

        within "#car-2" do 
            expect(page).to have_content("Ford")
        end

        within "#car-3" do 
            expect(page).to have_content("Toyota")
        end
    end

    it 'shows when each of the records was created' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
            what_line_of_car: "Taurus",
            year: 2022,
            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
            what_line_of_car: "Sorento",
            year: 2013,
            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
            what_line_of_car: "R1T",
            year: 2022,
            is_used: false)

        visit '/cars'

        within "#car-0" do 
            expect(page).to have_content(car_1.created_at)
        end

        within "#car-1" do 
            expect(page).to have_content(car_2.created_at)
        end

        within "#car-2" do 
            expect(page).to have_content(car_3.created_at)
        end

        within "#car-3" do 
            expect(page).to have_content(car_4.created_at)
        end
    end

    it 'displays a link at the top of the page that says Upgrades Index' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        within "#nav_links" do 
            expect(page).to have_content("Upgrades Index")
        end
    end

    it 'can click on the link and go to the Upgrades Index' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        click_link 'Upgrades Index'

        expect(current_path).to eq('/upgrades')
    end

    it 'displays a link at the top of the page that says Cars Index' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        within "#nav_links" do 
            expect(page).to have_content("Cars Index")
        end
    end

    it 'can click on the link and go to the Cars Index' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        click_link 'Cars Index'

        expect(current_path).to eq('/cars')
    end

    it 'has an edit link next to every parent' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'

        expect(page).to have_link("Click Here To Edit This #{car_1.brand_of_car}")
    end

    it 'after clicking edit next to parent, taken to parent edit page' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
                            what_line_of_car: "4Runner",
                            year: 2005,
                            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
                            what_line_of_car: "Taurus",
                            year: 2022,
                            is_used: false)
        car_3 = Car.create!(brand_of_car: "Kia",
                            what_line_of_car: "Sorento",
                            year: 2013,
                            is_used: true)
        car_4 = Car.create!(brand_of_car: "Rivian",
                            what_line_of_car: "R1T",
                            year: 2022,
                            is_used: false)

        visit '/cars'
        
        click_link "Click Here To Edit This Toyota"

        expect(current_path).to eq("/cars/#{car_1.id}/edit")
    end
end 