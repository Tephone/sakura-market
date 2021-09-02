class Users::ProductsController < ApplicationController
  def index
    @products = Product.created_at_desc.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end
end
