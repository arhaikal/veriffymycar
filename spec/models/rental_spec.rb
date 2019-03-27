require 'rails_helper'

RSpec.describe Rental, :type => :model do
  let(:user) { FactoryBot.create(:user) }
  let(:vehicle) { FactoryBot.create(:vehicle) }

  subject { described_class.new(
    pickup_date: Date.tomorrow,
    pickup_location: FFaker::Address.country,
    dropoff_date: Date.tomorrow.next_week,
    dropoff_location: FFaker::Address.country,  
    user_id: user.id,
    vehicle_id: vehicle.id
    ) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid with dropoff date after pick up date" do
      subject.dropoff_date = Date.yesterday
      expect(subject).to_not be_valid
    end

    it "is not valid with pickup date being in the past" do
      subject.pickup_date = Date.yesterday
      expect(subject).to_not be_valid
    end

    it "is not valid without a car id" do
      subject.vehicle_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a user id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
