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
  product = Product.create(name: "アイテム-#{i}", code: "455000223517-#{i}",
                           description: "#{i}-植物から抽出した精油だけで香りをつけました。ラベンダーとスウィートオレンジを基調にしたゆったりと落ち着く香り。皮脂をおとしすぎないよう、やさしく地肌を洗いあげ、健康な頭皮を保ちます。", price: 4000, quantity: 10)
  product.image.attach(io: File.open("./app/assets/images/image_#{i}.jpg"),
                       filename: "image_#{i}.jpg",
                       content_type: 'image/png')
  product.save
end
# rubocop:enable Layout/LineLength
