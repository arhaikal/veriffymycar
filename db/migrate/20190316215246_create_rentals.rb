class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.date :pickup_date
      t.date :dropoff_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
