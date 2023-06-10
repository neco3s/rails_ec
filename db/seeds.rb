# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rubocop:disable Layout/LineLength
5.times do |i|
  product = Product.create(name: "Shop item template-#{i}", code: "SKU: BST-#{i}",
                           description: "#{i}Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?", price: 4000)
  product.image.attach(io: File.open("./app/assets/images/image_#{i}.jpg"),
                       filename: "image_#{i}.jpg",
                       content_type: 'image/png')
  product.save
end
# rubocop:enable Layout/LineLength
