class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :cart_item

  class << self
    def create_after_order_create(user, order)
      user.cart_items.un_ordered.each do |cart_item|
        order.order_products.create!(cart_item_id: cart_item.id, price: cart_item.product.price * cart_item.amount)
      end
    end
  end
end
