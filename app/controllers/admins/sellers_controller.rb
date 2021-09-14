class Admins::SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]

  def index
    @sellers = Seller.default_order.page(params[:page])
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to admins_sellers_path, notice: '業者を作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to admins_sellers_path, notice: '業者情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @seller.destroy!
    redirect_to admins_sellers_path, notice: '業者情報を削除しました'
  end

  private

  def seller_params
    params.require(:seller).permit %i[name email password password_confirmation]
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end
