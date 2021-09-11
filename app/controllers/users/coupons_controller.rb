class Users::CouponsController < ApplicationController
  def index
    @coupons = Coupon.unget(current_user).default_order.page(params[:page])
  end
end
