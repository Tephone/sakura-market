class Sellers::SellersController < Sellers::ApplicationController
  before_action :set_seller, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to sellers_seller_path(@seller), notice: '業者情報を更新しました'
    else
      render :edit
    end
  end

  private

  def seller_params
    params.require(:seller).permit %i[name email password password_confirmation send_fee_per_box capacity_of_box]
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end
