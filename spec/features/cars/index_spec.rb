require 'rails_helper'

# User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

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
end 