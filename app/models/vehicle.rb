class Vehicle < ApplicationRecord
  has_many :rental

  def full_car_name
    "#{make} #{model} - #{year}"
  end
end
