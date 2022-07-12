require 'rails_helper'

describe Car, type: :model do 
    describe "validations" do 
        it { should validate_presence_of :brand_of_car}
        it { should validate_presence_of :what_line_of_car}
        it { should validate_presence_of :year}
        it { should allow_value(true).for(:is_used) }
        it { should allow_value(false).for(:is_used) }
    end

    describe 'relationships' do 
        it { should have_many :upgrades}
    end

    describe 'model actions' do 
      describe 'upgrade_count' do
        it 'counts the number of upgrades associated with the particular car' do
            Upgrade.destroy_all
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
            
            expect(car_1.upgrade_count).to eq(2)
            expect(car_2.upgrade_count).to eq(2)
            expect(car_3.upgrade_count).to eq(2)
            end 
        end 

        describe 'self.sort_created_at do' do
            it 'sorts the class by most recently created first' do
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
                
                expect(Car.sort_created_at).to eq([car_3, car_2, car_1])
                end 
            end
        end
end