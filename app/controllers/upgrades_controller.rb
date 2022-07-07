class UpgradesController < ApplicationController
    def index
        @upgrades = Upgrade.all 
    end

    def show
        @upgrade = Upgrade.find(params[:id])
    end
end