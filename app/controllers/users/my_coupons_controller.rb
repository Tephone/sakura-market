class Users::MyCouponsController < Users::ApplicationController
  def show
    @coupons = current_user.coupons.default_order.page(params[:page])
  end
end
