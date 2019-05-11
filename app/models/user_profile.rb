class UserProfile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street, presence: true
  validates :suburb, presence: true
  validates :postcode, numericality: { only_integer: true, message: "Enter a valid postcode" }
  validates :state, presence: true
  validates :country, presence: true
end
