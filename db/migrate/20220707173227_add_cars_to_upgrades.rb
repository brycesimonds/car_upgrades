class AddCarsToUpgrades < ActiveRecord::Migration[5.2]
  def change
    add_reference :upgrades, :car, foreign_key: true
  end
end
