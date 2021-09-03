class Order < ApplicationRecord
  belongs_to :delivery_time
  belongs_to :user
  has_many :order_products, dependent: :destroy
end
