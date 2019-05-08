class App < ApplicationRecord
  belongs_to :store
  has_many_attached :images
  has_one_attached :icon
  # config.assets.paths << Rails.root.join("app/assets", 'images/home') 
end
