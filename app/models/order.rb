class Order < ApplicationRecord
  belongs_to :delivery_time
  belongs_to :user
  has_many :order_products, dependent: :destroy
  validates :delivery_date, presence: true
  validate :invalid_holiday
  validate :should_be_after_3_to_14_weekdays

  scope :delivery_date_desc, -> { order(delivery_date: :desc) }

  class << self
    def save_order_and_create_order_product(user, order)
      ApplicationRecord.transaction do
        order.save!
        user.cart_items.each do |cart_item|
          order.order_products.create!(product_id: cart_item.product.id, amount: cart_item.amount, price: cart_item.product.price * cart_item.amount)
        end
        user.cart_items.each(&:destroy!)
      end
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
