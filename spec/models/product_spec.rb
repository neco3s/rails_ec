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
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_valid
  end

  it 'is invalid without a name' do
    product = Product.new(
      name: nil,
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid without a code' do
    product = Product.new(
      name: '商品名',
      code: nil,
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid without a description' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: nil,
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid without a price' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: nil,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid without a quantity' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: nil,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid without a discount' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: nil
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a duplicate code' do
    Product.create(
      name: '商品名',
      code: '111', #duplicate code
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    product = Product.new(
      name: '商品名',
      code: '111', #duplicate code
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a name that has more than 25 characters' do
    product = Product.new(
      name: '12345678901234567890123456',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a code that has more than 14 characters' do
    product = Product.new(
      name: '商品名',
      code: '123456789012345',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a description that has more than 300 characters' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '10文字の商品説明!' * 31,
      price: 100,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a price that is less than 0' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: -1,
      quantity: 10,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a quantity that is less than 0' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: -1,
      discount: 0
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a discount that is less than 0' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: -1
    )
    expect(product).to be_invalid
  end

  it 'is invalid with a discount that is more than 100' do
    product = Product.new(
      name: '商品名',
      code: '1234567890123',
      description: '商品説明',
      price: 100,
      quantity: 10,
      discount: 101
    )
    expect(product).to be_invalid
  end

end
