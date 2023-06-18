
class Admin::ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.all
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |name,password|
      name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASS']
      flash.now[:notice] = "管理者としてログイン中です🔐" if name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASS']
    end
  end
end
