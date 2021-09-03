class Users::OrdersController < ApplicationController
  def new
    @order = current_user.orders.new(send_fee: 200, cod_charge: 500)
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save!
        current_user.cart_items.un_ordered.each do |cart_item|
        @order.order_products.create(cart_item_id: cart_item.id, price: cart_item.product.price * cart_item.amount)
      end
      redirect_to users_products_path, notice: 'カートアイテムを購入しました'
    end
  end

  private

  def order_params
    params.require(:order).permit %i[delivery_date delivery_time_id send_fee cod_charge]
  end
end
