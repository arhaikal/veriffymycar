require 'rails_helper'

feature 'Exchange' do
  before :each do
    Vehicle.create(
      reg_number: 'ABC123',
      available_indicator: true,
      make: 'Mercedes',
      model: 'AMG',
      year: 2017)

    Location.create(
      city: "Los Angeles",
      country: "USA",
      name: "LAX"
      )
  end

  let(:user) { FactoryBot.create(:user) }

  scenario 'user can create a new rental' do
    visit root_path
    sign_in(user.email, user.password)

    within("#rental-form") do
      select("LAX, Los Angeles, USA", from: "rental_dropoff_location").select_option
      select("LAX, Los Angeles, USA", from: 'rental_pickup_location').select_option
      select("Mercedes AMG - 2017" , from: 'rental_vehicle_id').select_option
      click_button "Select My Car"
    end

    expect(page).to have_content("is ready")
  end

  def sign_in(email, password)
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    click_button "Log in"
  end
end