class Users::GetCouponsController < ApplicationController
  def create
    @get_coupon = current_user.get_coupons.new(get_coupon_params)
    @get_coupon.save!
    redirect_to users_my_coupon_path, notice: 'クーポンを取得しました'
  end

  private

  def get_coupon_params
    params.require(:get_coupon).permit(:coupon_id)
  end
end
