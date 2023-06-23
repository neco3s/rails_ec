# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :authenticate
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_url, success: '商品を登録しました', status: :created
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_url, success: '商品を更新しました', status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @product.destroy
        redirect_to admin_products_url, success: '商品を削除しました', status: :see_other
      else
        redirect_to admin_products_url, danger: '商品の削除に失敗しました', status: :internal_server_error
      end
    end

    private

    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASS']
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:image, :code, :name, :price, :description, :quantity)
    end
  end
end
