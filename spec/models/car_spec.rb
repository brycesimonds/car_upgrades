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
            it 'counts the number of upgrades associated with the particular car'
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
end


describe "::artist_name_by_song_id" do
      it "Create a test for a corresponding method that will find all artist names given a collection of song ids" do
        Song.destroy_all
        ras = @prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
        purple = @prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
        bury = @billie.songs.create!(title: 'bury a friend', length: 340, play_count: 1200000)
        bad = @billie.songs.create!(title: 'bad guy', length: 240, play_count: 100000)
        expect(Song.artist_name_by_song_id([ras.id, purple.id, bury.id, bad.id])).to eq(["Prince", "Billie Eilish"])
      end
    end