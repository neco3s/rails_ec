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
# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
