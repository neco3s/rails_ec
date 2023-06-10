class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    @products = Product.order(created_at: 'DESC')
  end
end
