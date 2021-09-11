class Coupon < ApplicationRecord
  has_many :get_coupons, dependent: :destroy
  validates :code, presence: true, length: {is: 12}
  validates :point, presence: true, numericality: { only_integer: true }

  scope :unget, -> (user) {where.not(id: user.coupons)}
end
