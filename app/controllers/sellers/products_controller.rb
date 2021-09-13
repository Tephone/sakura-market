class Sellers::ProductsController < Sellers::ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.default_order.page(params[:page])
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
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
    params.require(:product).permit %i[name price image content display]
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
