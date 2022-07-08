class CarsController < ApplicationController
    def index
        @cars = Car.all.order(created_at: :desc)
    end

    def show
        @car = Car.find(params[:id])
    end

    def upgrade_index
        @car_upgrades = Car.find(params[:car_id]).upgrades 
    end
end