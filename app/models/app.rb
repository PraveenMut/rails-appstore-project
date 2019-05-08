class App < ApplicationRecord
  belongs_to :store
  has_many_attached :images
  has_one_attached :icon
<<<<<<< HEAD
=======

>>>>>>> 35216fdcbfce6a9a8a99befb8a980fa1162f9171
  # config.assets.paths << Rails.root.join("app/assets", 'images/home') 
end
