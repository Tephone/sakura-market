class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :diaries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :get_coupons, dependent: :destroy
  has_many :coupons, through: :get_coupons, source: :coupon
  validates :name, presence: true

  def cart_items_price
    cart_items_price = 0
    cart_items = self.cart_items
    cart_items.each do |cart_item|
      cart_items_price += (cart_item.product.price * cart_item.amount)
    end
    cart_items_price
  end

  def send_fee
    cart_items_count = self.cart_items.count
    600 * (cart_items_count.to_f / 5).ceil
  end

  def cod_charge
    cart_items_price = self.cart_items_price
    if cart_items_price >= 1 && cart_items_price < 10000
      300
    elsif cart_items_price >= 10000 && cart_items_price < 30000
      400
    elsif cart_items_price >= 30000 && cart_items_price < 100000
      600
    elsif cart_items_price >= 100000
      1000
    end
  end

  def remaining_point
    self.coupons.sum(:point) - self.orders.sum(:consume_point)
  end
end
