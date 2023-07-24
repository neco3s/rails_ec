# frozen_string_literal: true

require 'securerandom'
# rubocop:disable Hc/RailsSpecificActionName Layout/LineLength Metrics/MethodLength Metrics/AbcSize
class ProductsController < ApplicationController
  def index
    products = Product.all
    products.each do |product|
      product.product_count_in_cart = CartTransaction.where(product_id: product.id) ? CartTransaction.where(product_id: product.id).length : 0
    end
    @products = products
  end

  def show
    product = Product.find(params[:id])
    product.product_count_in_cart = CartTransaction.where(product_id: product.id) ? CartTransaction.where(product_id: product.id).length : 0
    @product = product

    @products = Product.order(created_at: 'DESC')
  end

  def cart
    @products = []
    cookies.select { |k, _v| k.match(/products_[a-f\d]{8}-([a-f\d]{4}-){3}[a-f\d]{12}_cart/) }.each do |_k, v|
      object = JSON.parse(v)
      product_id = object['product_id']
      product = Product.find(product_id)
      product.expire = object['expire']
      product.uid = object['uid']
      @products << product
    end
    @total_price = @products.map do |product|
      product.discount.positive? ? (product.price * ((100 - product.discount) / 100.0)).to_i : product.price.to_i
    end.sum
  end

  def checkout
    @products = []
    cookies.select { |k, _v| k.match(/products_[a-f\d]{8}-([a-f\d]{4}-){3}[a-f\d]{12}_cart/) }.each do |_k, v|
      object = JSON.parse(v)
      product_id = object['product_id']
      product = Product.find(product_id)
      product.expire = object['expire']
      product.uid = object['uid']
      @products << product
    end
    @total_price = @products.map do |product|
      product.discount.positive? ? (product.price * ((100 - product.discount) / 100.0)).to_i : product.price.to_i
    end.sum
  end

  def add_cart
    product = Product.find(params[:id])
    product.product_count_in_cart = CartTransaction.where(product_id: product.id) ? CartTransaction.where(product_id: product.id).length : 0

    if params[:quantity].to_i > 1
      if (product.quantity - product.product_count_in_cart) < params[:quantity].to_i
        flash[:danger] = 'タッチの差で商品を確保できませんでした'
        redirect_to action: 'show', id: params[:id]
        return
      end
      ActiveRecord::Base.transaction do
        params[:quantity].to_i.times do
          uid = SecureRandom.uuid
          CartTransaction.create(uid: uid, product_id: params[:id])
          cookies[:"products_#{uid}_cart"] =
            { value: "{\"uid\":\"#{uid}\",\"product_id\":#{params[:id]},\"expire\":\"#{1.hour.from_now}\"}",
              expires: 1.hour.from_now }
        end
      end
    else
      if (product.quantity - product.product_count_in_cart) < 1
        flash[:danger] = 'タッチの差で商品を確保できませんでした'
        redirect_to action: 'show', id: params[:id]
        return
      end
      ActiveRecord::Base.transaction do
        uid = SecureRandom.uuid
        CartTransaction.create(uid: uid, product_id: params[:id])
        cookies[:"products_#{uid}_cart"] =
          { value: "{\"uid\":\"#{uid}\",\"product_id\":#{params[:id]},\"expire\":\"#{1.hour.from_now}\"}",
            expires: 1.hour.from_now }
      end
    end

    flash[:success] = 'カートに商品を追加しました'
    if request.referer =~ %r{products/\d+}
      redirect_to action: 'show', id: params[:id]
    else
      redirect_to action: 'index'
    end
  end

  def return_to_shelf
    params[:uid]
    Rails.logger.debug 'CartTransaction.find_by(uid: params[:uid]).destroy'
    Rails.logger.debug CartTransaction.find_by(uid: params[:uid]).destroy
    cookies.delete(:"products_#{params[:uid]}_cart")
    redirect_to action: 'cart'
  end
end
# rubocop:enable Hc/RailsSpecificActionName Layout/LineLength Metrics/MethodLength Metrics/AbcSize
