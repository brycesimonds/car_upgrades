class CarsController < ApplicationController
    def index
        @cars = Car.all.order(created_at: :desc)
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

    def car_params
        params.permit(:brand_of_car, :what_line_of_car, :year, :is_used)
    end
end