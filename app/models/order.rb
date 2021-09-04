class Order < ApplicationRecord
  belongs_to :delivery_time
  belongs_to :user
  has_many :order_products, dependent: :destroy
  validates :delivery_date, presence: true
  validate :invalid_holiday
  
  scope :delivery_date_desc, -> {order('delivery_date DESC')}
  
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
      send_fee = 600 * (cart_items_count.to_f / 5).ceil
      send_fee
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
end
