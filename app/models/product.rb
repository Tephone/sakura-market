class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :seller
  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
