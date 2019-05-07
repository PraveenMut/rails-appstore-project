# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test_user_2 = User.create({:email => 'test@test.com.au', :password => '123456', :password_confirmation => '123456'})

puts "Creating Applications"

# 2.times do
#   name = Faker::Lorem.word
#   genre = Faker::Lorem.word
#   user_id = [1,2].sample
#   @created_store = Store.create({:name=>name,:genre=>genre,:user_id=>user_id})
#   p @create_store.name
#   p @create_store.genre
# end

10.times do
  name = Faker::App.name
  blurb = Faker::Lorem.sentence(1)
  description = Faker::Lorem.sentence(3)
  store_id = [1,2].sample
  price = rand(1..10) + rand().round(2)
  @created_app = App.create({:name=>name, :blurb=>blurb, :description=>description, :store_id=>store_id, :price=>price})
  p @created_app.name
end


puts "Done seeding Applications"