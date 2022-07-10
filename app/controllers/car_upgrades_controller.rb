class CarUpgradesController < ApplicationController
    def index
        car = Car.find(params[:car_id])
        @upgrades = car.upgrades 
    end

    def create_upgrade
        binding.pry
        @car = Car.find(params[:id])
    end
end