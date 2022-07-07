# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Upgrade.destroy_all
Car.destroy_all

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
car_5 = Car.create!(brand_of_car: "Telsa",
                    what_line_of_car: "Model S",
                    year: 2022,
                    is_used: false)

car_1.upgrades.create!(car_part_name: "Suspension",
                       cost_of_part: 1200,
                       need_mechanic: false)
car_1.upgrades.create!(car_part_name: "Engine Replacement",
                       cost_of_part: 7000,
                       need_mechanic: true)

car_2.upgrades.create!(car_part_name: "Wheels",
                       cost_of_part: 1300,
                       need_mechanic: true)
car_2.upgrades.create!(car_part_name: "Tires",
                       cost_of_part: 300,
                       need_mechanic: true)

car_3.upgrades.create!(car_part_name: "Windows",
                       cost_of_part: 500,
                       need_mechanic: true)
car_3.upgrades.create!(car_part_name: "Audio",
                       cost_of_part: 200,
                       need_mechanic: false)

car_4.upgrades.create!(car_part_name: "Brakes",
                       cost_of_part: 800,
                       need_mechanic: true)
car_4.upgrades.create!(car_part_name: "Decals",
                       cost_of_part: 100,
                       need_mechanic: false)

car_5.upgrades.create!(car_part_name: "Windshield",
                       cost_of_part: 500,
                       need_mechanic: true)
car_5.upgrades.create!(car_part_name: "Battery",
                       cost_of_part: 1000,
                       need_mechanic: true)

