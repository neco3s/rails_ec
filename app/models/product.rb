# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  code        :string           not null
#  description :text             not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quantity    :integer          not null
#
class Product < ApplicationRecord
  validates :name, :code, :description, :price, :quantity, presence: true # 空でないことを想定
  # validates :code, uniqueness: true # 重複しないJANコードを想定
  # validates :name, length: { maximum: 25 } # 25文字以内の商品名を想定
  # validates :code, length: { maximum: 13 } # 13桁のJANコードを想定
  # validates :description, length: { maximum: 300 } # 300文字以内の商品説明を想定

  has_one_attached :image
end
