class CarUpgradesController < ApplicationController
    def index
        @car = Car.find(params[:car_id])
        if params[:sort] == "activated"
            @upgrades = @car.upgrades.order('car_part_name')
        else 
            @upgrades = @car.upgrades 
        end 
    end

    def new
        @car = Car.find(params[:car_id])
    end

    def create 
        upgrade = Upgrade.create(upgrade_params)
        car = Car.find(params[:car_id])
        redirect_to "/cars/#{car.id}/upgrades"
    end

    private 
    def upgrade_params
        params.permit(:car_part_name, :cost_of_part, :need_mechanic, :car_id)
    end
end