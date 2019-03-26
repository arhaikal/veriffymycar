class Document < ApplicationRecord
  belongs_to :user 
  validates_presence_of :country, :document_type, :valid_from, :valid_until, :number
end
