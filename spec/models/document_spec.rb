require 'rails_helper'

RSpec.describe Document, type: :model do
  subject { FactoryBot.create(:document) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a user" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a country" do
      subject.country = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a document_type" do
      subject.document_type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid_from" do
      subject.valid_from = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid_until" do
      subject.valid_until = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a number" do
      subject.number = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with valid until being before valid from" do
      subject.valid_from = Date.tomorrow.next_week
      subject.valid_until = Date.tomorrow

      expect(subject).to_not be_valid
    end

    it "is not valid with valid until being in the past" do
      subject.valid_until = Date.yesterday
      expect(subject).to_not be_valid
    end
  end
end
