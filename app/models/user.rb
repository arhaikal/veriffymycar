class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable 

  validates_presence_of :first_name, :last_name, :email, :password 

  has_many :documents
  has_many :rentals
end
