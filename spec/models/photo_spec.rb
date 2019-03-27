require 'rails_helper'

RSpec.describe Photo, type: :model do

  subject { FactoryBot.create(:photo) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a document" do
      subject.document_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if one of the attachments is missing" do
      subject.face = nil
      expect(subject).to_not be_valid
    end
  end
end
