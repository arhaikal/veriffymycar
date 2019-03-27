class Document < ApplicationRecord
  belongs_to :user 
  validates_presence_of :country, :document_type, :valid_from, :valid_until, :number
  validate :valid_from_before_valid_until, :valid_until_date_is_in_the_future

  def valid_from_before_valid_until
    if valid_from && valid_until && valid_from > valid_until
      errors[:base] << "Valid from date has to be before valid until date!"
    end
  end

  def valid_until_date_is_in_the_future
    if valid_until && valid_until < Date.today
      errors[:base] << "Valid until date has to be in the future"
    end
  end
end
