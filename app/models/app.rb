class App < ApplicationRecord
  belongs_to :store
  has_many_attached :images
  has_one_attached :icon
  validates :Short_Description, presence: true, length: {maximum: 60}, allow_nil: false
  # config.assets.paths << Rails.root.join("app/assets", 'images/home') 
end
