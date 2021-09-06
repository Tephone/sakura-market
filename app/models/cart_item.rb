class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :order_product, dependent: :destroy
  validates :amount, presence: true

  scope :un_ordered, -> { where.not(id: OrderProduct.select(:cart_item_id)) }
end
