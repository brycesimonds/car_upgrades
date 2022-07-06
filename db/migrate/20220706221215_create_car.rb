class CreateCar < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand_of_car
      t.string :what_line_of_car
      t.integer :year
      t.boolean :is_used

      t.timestamps
    end
  end
end
