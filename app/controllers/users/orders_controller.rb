class Users::OrdersController < ApplicationController
  def new
    @send_fee = Order.send_fee(current_user)
    @cod_charge = Order.new.cod_charge
    @order = current_user.orders.new(send_fee: @send_fee, cod_charge: @cod_charge)
  end

  def create
    @order = current_user.orders.new(order_params)
    if current_user.cart_items.un_ordered.present?
      ApplicationRecord.transaction do
        @order.save!
        OrderProduct.create_after_order_create(current_user, @order)
        redirect_to users_products_path, notice: 'カートアイテムを購入しました'
      end
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit %i[delivery_date delivery_time_id send_fee cod_charge]
  end
end
