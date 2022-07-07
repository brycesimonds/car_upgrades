require 'rails_helper'

RSpec.describe "cars show page", type: :feature do 
    it 'shows the parent(cars) matching the id in the path including its attributes' do 
        car_1 = Car.create!(brand_of_car: "Toyota",
            what_line_of_car: "4Runner",
            year: 2005,
            is_used: true)
        car_2 = Car.create!(brand_of_car: "Ford",
            what_line_of_car: "Taurus",
            year: 2022,
            is_used: false)

        visit "/cars/#{car_1.id}"

        expect(page).to have_content(car_1.brand_of_car)
        expect(page).to have_content("Model: #{car_1.what_line_of_car}")
        expect(page).to have_content("Year: #{car_1.year}")
        expect(page).to have_content("Is it used?: #{car_1.is_used}")
        expect(page).to_not have_content(car_2.brand_of_car)
    end
end 