# frozen_string_literal: true

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
end
