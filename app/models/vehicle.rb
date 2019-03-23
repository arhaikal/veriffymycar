class Vehicle < ApplicationRecord
  has_many :rental
  
  attr_accessor :car
end
