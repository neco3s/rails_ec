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

  end

  def checkout
    
  end

  def add_cart
    uid = SecureRandom.uuid
    cartProduct = CartTransaction.create(uid: uid, product_id: params[:id])
    if cookies[:"products_#{uid}_cart"].present?
      cookies[:"products_#{uid}_cart"] = {value: [cookies[:"products_#{uid}_cart"],{uid: uid,product_id:params[:id],expires: 1.minute.from_now}], expires: Time.zone.parse(cookies[:"products_#{uid}_cart"].match(/expire:([^&}]+)/)[1])}
    else
      cookies[:"products_#{uid}_cart"] = { value: "{uid: #{uid},product_id:#{params[:id]},expire: #{1.minute.from_now}}",expires:1.minute.from_now }
    end
    p cookies.select{|k,v| k.match(/products_[a-f\d]{8}-([a-f\d]{4}-){3}[a-f\d]{12}_cart/)}
    redirect_to action: "index"
  end
end
