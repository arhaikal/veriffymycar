class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :reg_number
      t.boolean :available_indicator
      t.string :make
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
