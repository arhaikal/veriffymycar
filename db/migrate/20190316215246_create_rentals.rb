class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.date :pickup_date
      t.string :pickup_location
      t.date :dropoff_date
      t.string :dropoff_location
      t.references :user, foreign_key: true
      t.belongs_to :vehicle, index: true

      t.timestamps
    end
  end
end
