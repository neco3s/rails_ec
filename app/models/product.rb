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
  validates :name, :code, :description, :price, :quantity, :discount, presence: true # 空でないことを想定
  validates :code, uniqueness: true # 重複しないJANコードを想定
  validates :name, length: { maximum: 25 } # 25文字以内の商品名を想定
  validates :code, length: { maximum: 14 } # 13桁のJANコードを想定
  validates :description, length: { maximum: 300 } # 300文字以内の商品説明を想定
  validates :price, numericality: { greater_than_or_equal_to: 0 } # 0以上の価格を想定
  validates :quantity, numericality: { greater_than_or_equal_to: 0 } # 0以上の在庫数を想定
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 } # 割引率は0以上100以下を想定

  has_one_attached :image
end
