class Admins::ProductsController < Admins::ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.default_order.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path, notice: '商品を登録しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admins_products_path, notice: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to admins_products_path, notice: '削除しました'
  end

  private

  def product_params
    params.require(:product).permit %i[name price image content display stock seller_id]
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
