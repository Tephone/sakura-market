class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # has_one :order_product, dependent: :nullify
  validates :amount, presence: true
end
