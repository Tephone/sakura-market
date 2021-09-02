class Users::CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show destroy]
  
  def index
    @cart_items = current_user.cart_items.created_at_desc.page(params[:page])
  end

  def new
    product = Product.find(params[:product_id]) 
    @cart_item = current_user.cart_items.new(product_id: product.id)
  end

  def create
    @cart_item = current_user.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to users_cart_items_path, notice: 'カートに追加しました'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @cart_item.destroy!
    redirect_to users_cart_items_path, notice: 'カートから外しました'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit %i(product_id amount)
  end

  def set_cart_item
    @cart_item = current_user.cart_items.find(params[:id])
  end
end
