class Sellers::OrdersController < Sellers::ApplicationController
  before_action :set_order, only: %i[show edit update]

  def index
    @orders = current_seller.orders.delivery_date_desc.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    @status = params[:order][:status].to_i
    if @order.update(status: @status)
      redirect_to sellers_order_path(@order), notice: 'ステータスを変更しました'
    else
      render :edit
    end
  end

  private

  def set_order
    @order = current_seller.orders.find(params[:id])
  end
end
