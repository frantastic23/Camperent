# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# generate 20 users
(1..20).each do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

users = User.all
(1..20).each do |i|
  camper = Camper.new(model: Faker::Vehicle.model, price: Faker::Commerce.price, description: Faker::Vehicle.standard_specs, availability: true, photo_url: 'https://www.autocaravanas.es/wp-content/uploads/2020/09/Itineo-PF600-2021.jpg')
  camper.user = users[i]
  camper.save
end
