# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vehicle.create([
  { reg_number: 'ABC123',
   available_indicator: true,
   make: 'Mercedes',
   model: 'AMG',
   year: 2017 },

   { reg_number: '881BDR',
    available_indicator: true,
    make: 'Honda',
    model: 'Accord',
    year: 2007 },

  { reg_number: 'POW431',
    available_indicator: true,
    make: 'Fiat',
    model: 'Panda',
    year: 2019 },

  { reg_number: 'LKA234',
    available_indicator: true,
    make: 'Kia',
    model: 'Picanto',
    year: 2015 },

  { reg_number: 'PLD345',
   available_indicator: true,
   make: 'BMW',
   model: '730',
   year: 2014 }
  
])

Location.create([
  {
    city: "Tallinn",
    country: "Estonia",
    name: "Lennujaam"
  },

  {
    city: "Riga",
    country: "Latvia",
    name: "Bus Station"
  },

  {
    city: "Los Angeles",
    country: "USA",
    name: "LAX"
  },

  {
    city: "Paris",
    country: "France",
    name: "Charles De Gaulle Airport"
  }

])
