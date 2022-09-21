# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = Brand.create([{ name: 'Honda' }, { name: 'Yamaha' }, { name: 'Zoomo' }, { name: 'nothng' }])

models = Model.create([{ name: 'Cx 1', brand: brands[rand(0..3)] }, { name: 'PP 50', brand: brands[rand(0..3)] }, { name: 'L99', brand: brands[rand(0..3)] }, { name: '42', brand: brands[rand(0..3)] }, { name: 'Best', brand: brands[rand(0..3)] }, { name: 'Lower', brand: brands[rand(0..3)] }])

(0..49).each do |i|
  vehicle = Vehicle.create(
    name: "Vehicle #{i}",
    legal_identifier: i.to_s,
    frame_size: rand(0..100),
    status: rand(0..2),
    model: models[rand(0..5)]
  )

  puts vehicle
end
