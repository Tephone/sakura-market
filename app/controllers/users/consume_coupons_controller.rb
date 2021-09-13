class Users::ConsumeCouponsController < Users::ApplicationController
  def index
    @orders = current_user.orders.delivery_date_desc.page(params[:page])
  end
end
