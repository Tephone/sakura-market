class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :cart_items, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
end
