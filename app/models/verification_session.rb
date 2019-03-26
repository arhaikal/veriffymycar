class VerificationSession < ApplicationRecord
  belongs_to :user
  belongs_to :document

  VERIFIED = 'verified'
  SUBMITTED = 'submitted'
  NOT_VERIFIED = 'unverified'
end
