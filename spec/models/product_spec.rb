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
require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with name, code, description, price, quantity, and discount' do

  end

  it 'is invalid without a name' do

  end

  it 'is invalid without a code' do

  end

  it 'is invalid without a description' do

  end

  it 'is invalid without a price' do

  end

  it 'is invalid without a quantity' do

  end

  it 'is invalid without a discount' do

  end

  it 'is invalid with a duplicate code' do

  end

  it 'is invalid with a name that has more than 25 characters' do

  end

  it 'is invalid with a code that has more than 14 characters' do

  end

  it 'is invalid with a description that has more than 300 characters' do

  end

  it 'is invalid with a price that is less than 0' do

  end

  it 'is invalid with a quantity that is less than 0' do

  end

  it 'is invalid with a discount that is less than 0' do

  end

  it 'is invalid with a discount that is more than 100' do
    
  end

end
