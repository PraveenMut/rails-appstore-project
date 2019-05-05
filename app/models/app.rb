class App < ApplicationRecord
  belongs_to :store
  has_many_attached :images

  # config.assets.paths << Rails.root.join("app/assets", 'images/home') 
end
