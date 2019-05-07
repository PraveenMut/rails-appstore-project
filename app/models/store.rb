class Store < ApplicationRecord
  belongs_to :user
  has_many :apps
  validates :name, presence: true
  validates :genre, presence: true
end
