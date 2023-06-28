# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { '商品名' }
    code { '1234567890123' }
    description { '商品説明' }
    price { 100 }
    quantity { 10 }
    discount { 0 }
  end
end
