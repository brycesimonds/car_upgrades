class CreateUpgrade < ActiveRecord::Migration[5.2]
  def change
    create_table :upgrades do |t|
      t.string :car_part_name
      t.integer :cost_of_part
      t.boolean :need_mechanic

      t.timestamps
    end
  end
end
