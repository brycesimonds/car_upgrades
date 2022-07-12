class UpgradesController < ApplicationController
    def index
        @upgrades = Upgrade.all 
    end

    def show
        @upgrade = Upgrade.find(params[:id])
    end

    def edit
        @upgrade = Upgrade.find(params[:id])
    end

    def update
        @upgrade = Upgrade.find(params[:id])
        @upgrade.update(upgrade_params)
        redirect_to "/upgrades/#{@upgrade.id}"
    end

    def delete
        upgrade = Upgrade.find(params[:id])
        upgrade.destroy
        redirect_to "/upgrades"
     end

    private 
    def upgrade_params
        params.permit(:car_part_name, :cost_of_part, :need_mechanic)
    end
end

