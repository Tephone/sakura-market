class Users::MyCouponsController < ApplicationController
  def show
    @coupons = current_user.coupons.default_order.page(params[:page])
  end
end
