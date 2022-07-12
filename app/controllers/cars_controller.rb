class CarsController < ApplicationController
    def index
        @cars = Car.sort_created_at
    end

    def show
        @car = Car.find(params[:id])
    end

    def new
        
    end

    def create 
        car = Car.create(car_params)
        redirect_to '/cars'
    end

    def edit
        @car = Car.find(params[:car_id])
    end

    def update
        car = Car.find(params[:id])
        car.update(car_params)
        redirect_to "/cars/#{car.id}"
    end

    def delete
       upgrades = Upgrade.where(car_id: "#{params[:id]}")
       car = Car.find(params[:id])
       upgrades.destroy_all
       car.destroy
       redirect_to "/cars"
    end

private 
    def car_params
        params.permit(:brand_of_car, :what_line_of_car, :year, :is_used)
    end
end