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
        car = Car.create(brand_of_car: params[:brand_of_car], 
                         what_line_of_car: params[:what_line_of_car],
                         year: params[:year],
                         is_used: params[:is_used])
        redirect_to '/cars'
    end
end