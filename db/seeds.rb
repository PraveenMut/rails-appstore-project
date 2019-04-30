# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user_2 = User.create({:email => 'test@test.com.au', :password => '123456', :password_confirmation => '123456'})

puts "Creating Stores and Applications"

10.times do
  name = Faker::Lorem.word
  genre = Faker::Lorem.word
  user_id = [1,2].sample
  @created_store = Store.create({:name=>name,:genre=>genre,:user_id=>user_id})
  10.times do
    name = Faker::App.name
    description = Faker::Lorem.sentence(3)
    store_id = @created_store.id
    price = rand(1..10) + rand().round(2)
    @created_app = App.create({:name=>name, :description=>description, :store_id=>store_id, :price=>price})
  end
end

puts "Done seeding Stores and Applications"