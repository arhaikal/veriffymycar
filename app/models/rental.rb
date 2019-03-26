class Rental < ApplicationRecord
  belongs_to :user
  validates_presence_of :pickup_date, :dropoff_date, :pickup_location, :dropoff_location, :vehicle_id

  validate :dropoff_date_after_pickup, :pickup_date_is_in_the_future
  
  def dropoff_date_after_pickup 
    if pickup_date > dropoff_date
      errors[:base] << "Pick up time has to be before drop off time!"
    end
  end

  def pickup_date_is_in_the_future
    if pickup_date < Date.today
      errors[:base] << "Pick up date has to be in the future"
    end
  end
end
