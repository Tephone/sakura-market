class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders.delivery_date_desc
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.send_fee = current_user.send_fee
    @order.cod_charge =  current_user.cod_charge
    if Order.save_order_and_create_order_product(current_user, @order)
      redirect_to users_products_path, notice: 'カートアイテムを購入しました'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit %i[delivery_date delivery_time_id]
  end
end
