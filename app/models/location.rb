class Location < ApplicationRecord
  def full_location_name
    "#{name}, #{city}, #{country}"
  end
end
