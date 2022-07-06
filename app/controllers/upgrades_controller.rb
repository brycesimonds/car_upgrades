class UpgradesController < ApplicationController
    def index
        @upgrades = Upgrade.all 
    end
end