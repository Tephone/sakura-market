class Admins::CouponsController < Admins::ApplicationController
  def index
    @coupons = Coupon.default_order.page(params[:page])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to admins_coupons_path, notice: 'クーポンを作成しました'
    else
      render :new
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy!
    redirect_to admins_coupons_path, notice: 'クーポンを削除しました'
  end

  private

  def coupon_params
    params.require(:coupon).permit %i[code point]
  end
end
