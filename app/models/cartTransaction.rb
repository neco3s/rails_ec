# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_transactions
#
#  id         :bigint           not null, primary key
#  uid        :integer          not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartTransaction < ApplicationRecord
  validates :uid, :product_id, presence: true 

  belongs_to :product
end
