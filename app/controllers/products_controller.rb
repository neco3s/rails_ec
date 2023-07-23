# frozen_string_literal: true

require 'securerandom'

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    @products = Product.order(created_at: 'DESC')
  end

  def cart
    @products = []
    cookies.select{|k,v| k.match(/products_[a-f\d]{8}-([a-f\d]{4}-){3}[a-f\d]{12}_cart/)}.each do |k,v|
      object = JSON.parse(v)
      product_id = object["product_id"]
      product = Product.find(product_id)
      product.expire = object["expire"]
      product.uid = object["uid"]
      @products << product
    end
    @total_price = @products.map{ |product| product.discount > 0 ? (product.price * ( (100 - product.discount) / 100.0 )).to_i : product.price.to_i }.sum
  end

  def checkout
    
  end

  def add_cart
    uid = SecureRandom.uuid
    cartProduct = CartTransaction.create(uid: uid, product_id: params[:id])
    if cookies[:"products_#{uid}_cart"].present?
      cookies[:"products_#{uid}_cart"] = {value: [cookies[:"products_#{uid}_cart"],"{\"uid\":\"#{uid}\",\"product_id\":#{params[:id]},\"expires\":\"#{1.hour.from_now}\"}"], expires: Time.zone.parse(cookies[:"products_#{uid}_cart"].match(/expire:([^&}]+)/)[1])}
    else
      cookies[:"products_#{uid}_cart"] = { value: "{\"uid\":\"#{uid}\",\"product_id\":#{params[:id]},\"expire\":\"#{1.hour.from_now}\"}",expires:1.hour.from_now }
    end
    redirect_to action: "index"
  end

  def return_to_shelf
    params[:uid]
    p 'CartTransaction.find_by(uid: params[:uid]).destroy'
    p CartTransaction.find_by(uid: params[:uid]).destroy
    cookies.delete(:"products_#{params[:uid]}_cart")
    redirect_to action: "cart"
  end
end
