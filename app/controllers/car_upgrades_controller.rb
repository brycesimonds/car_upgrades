class CarUpgradesController < ApplicationController
    def index
        car = Car.find(params[:car_id])
        @upgrades = car.upgrades 
    end
end