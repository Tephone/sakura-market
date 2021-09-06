class Order < ApplicationRecord
  belongs_to :delivery_time
  belongs_to :user
  has_many :order_products, dependent: :destroy
  validates :delivery_date, presence: true
  validate :invalid_holiday
  validate :should_be_after_3_to_14_weekdays

  scope :delivery_date_desc, -> { order('delivery_date DESC') }

  class << self
    def cart_items_price
      cart_items_price = 0
      cart_items = CartItem.un_ordered
      cart_items.each do |cart_item|
        cart_items_price += (cart_item.product.price * cart_item.amount)
      end
      cart_items_price
    end

    def send_fee(user)
      cart_items_count = user.cart_items.un_ordered.count
      600 * (cart_items_count.to_f / 5).ceil
    end
  end

  def cod_charge
    cart_items_price = self.class.cart_items_price
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

  def invalid_holiday
    if self.delivery_date.wday == 0 || self.delivery_date.wday == 6
      errors.add(:delivery_date, 'は平日(月〜金)を指定してください')
    end
  end

  def should_be_after_3_to_14_weekdays
    dates = (Date.current.since(3.days).to_date..ApplicationController.helpers.max_delivery_date.to_date).to_a
    if !dates.include?(self.delivery_date)
      errors.add(:delivery_date, 'は3営業日（営業日: 月-金）から14営業日までの期間で選択してください')
    end
  end
end
