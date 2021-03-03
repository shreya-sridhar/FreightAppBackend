# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

10.times do
    User.create(
      name: Faker::Internet.unique.user_name,
      address: Faker::Address.full_address,
      email: Faker::Internet.email,
      wallet: "cash",
      driver_star_rating: rand(0.0...5.0),
      customer_star_rating:rand(0.0...5.0),
      status: "idle",
      is_driver: false,
      vehicle_type: 'truck',
      vehicle_number: '789' ,
      password_digest: '12345',
      latitude:Faker::Address.latitude,
      longitude:Faker::Address.longitude
    )
  end

