class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :amount, presence: true,
                      numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: ->(cart_item) {cart_item.product.stock} }

  def save_and_update_product_stock
    ApplicationRecord.transaction do
      self.save
      self.product.update(stock: self.product.stock - self.amount)
    end
  end

  def destroy_and_update_product_stock
    ApplicationRecord.transaction do
      self.product.update(stock: self.product.stock + self.amount)
      self.destroy!
    end
  end
end
