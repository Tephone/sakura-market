class Users::GetCouponsController < Users::ApplicationController
  def new
    @coupon = current_user.get_coupons.new
  end

  def create
    @coupon = Coupon.find_by(code: params[:get_coupon][:coupon_code])
    @get_coupon = current_user.get_coupons.new(coupon_id: @coupon.id)
    if @get_coupon.save
      redirect_to users_my_coupon_path, notice: 'クーポンを取得しました'
    else
      render :new
    end
  end
end
