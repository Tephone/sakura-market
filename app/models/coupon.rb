class Coupon < ApplicationRecord
  validates :code, presence: true, length: {is: 12}
  validates :point, presence: true, numericality: { only_integer: true }
end
