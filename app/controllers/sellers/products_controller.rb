class Sellers::ProductsController < Sellers::ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = current_seller.products.default_order.page(params[:page])
  end

  def show
  end

  def new
    @product = current_seller.products.new
  end

  def create
    @product = current_seller.products.new(product_params)
    if @product.save
      redirect_to sellers_products_path, notice: '商品を登録しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to sellers_products_path, notice: '商品情更新しました'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to sellers_products_path, notice: '商品を削除しました'
  end

  private

  def product_params
    params.require(:product).permit %i[name price image content display stock]
  end

  def set_product
    @product = current_seller.products.find(params[:id])
  end
end
