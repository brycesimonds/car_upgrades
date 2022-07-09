class CarsController < ApplicationController
    def index
        @cars = Car.all.order(created_at: :desc)
    end

    def show
        @car = Car.find(params[:id])
    end
end