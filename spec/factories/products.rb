# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { '商品名' }
    sequence(:code) { |n| "1234567890-#{n}" }
    description { '商品説明' }
    price { 100 }
    quantity { 10 }
    discount { 0 }
  end
end
