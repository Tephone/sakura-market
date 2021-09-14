class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders.delivery_date_desc.page(params[:page])
  end

  def new
    @order = current_user.orders.new
    unless current_user.same_cart_item_seller?
      redirect_to users_cart_items_path, alert: '複数業者の商品入っています'
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.send_fee = current_user.send_fee
    @order.cod_charge = current_user.cod_charge
    @order.seller_id = current_user.products.first.seller.id
    if Order.save_order_and_create_order_product(current_user, @order)
      redirect_to users_products_path, notice: 'カートアイテムを購入しました'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit %i[delivery_date delivery_time_id consume_point]
  end
end
