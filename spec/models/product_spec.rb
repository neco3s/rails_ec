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
# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with name, code, description, price, quantity, and discount' do
    # FactoryBot.buildでは、buildされたインスタンスはDBに保存されない
    expect(FactoryBot.build(:product)).to be_valid
  end

  it 'is invalid without a name' do
    # FactoryBot.build(:product, name: nil)とすることで、nameがnilのproductを作成することができる(特定のフィールドをオーバーライドできる、他のフィールドはFactoryBotの定義に従う)
    expect(FactoryBot.build(:product, name: nil)).to be_invalid
  end

  it 'is invalid without a code' do
    expect(FactoryBot.build(:product, code: nil)).to be_invalid
  end

  it 'is invalid without a description' do
    expect(FactoryBot.build(:product, description: nil)).to be_invalid
  end

  it 'is invalid without a price' do
    expect(FactoryBot.build(:product, price: nil)).to be_invalid
  end

  it 'is invalid without a quantity' do
    expect(FactoryBot.build(:product, quantity: nil)).to be_invalid
  end

  it 'is invalid without a discount' do
    expect(FactoryBot.build(:product, discount: nil)).to be_invalid
  end

  it 'is invalid with a duplicate code' do
    FactoryBot.create(:product, code: '111')
    expect(FactoryBot.build(:product, code: '111')).to be_invalid
  end

  it 'is invalid with a name that has more than 25 characters' do
    expect(FactoryBot.build(:product, name: '12345678901234567890123456')).to be_invalid
  end

  it 'is invalid with a code that has more than 14 characters' do
    expect(FactoryBot.build(:product, code: '123456789012345')).to be_invalid
  end

  it 'is invalid with a description that has more than 300 characters' do
    expect(FactoryBot.build(:product, description: '10文字の商品説明!' * 31)).to be_invalid
  end

  it 'is invalid with a price that is less than 0' do
    expect(FactoryBot.build(:product, price: -1)).to be_invalid
  end

  it 'is invalid with a quantity that is less than 0' do
    expect(FactoryBot.build(:product, quantity: -1)).to be_invalid
  end

  it 'is invalid with a discount that is less than 0' do
    expect(FactoryBot.build(:product, discount: -1)).to be_invalid
  end

  it 'is invalid with a discount that is more than 100' do
    expect(FactoryBot.build(:product, discount: 101)).to be_invalid
  end

end
