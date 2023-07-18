# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  code        :string           not null
#  description :text             default("※説明未登録..."), not null
#  price       :integer          default(100), not null
#  discount    :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quantity    :integer          default(0), not null
#
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
