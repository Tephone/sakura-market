class Diary < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  validates :date, presence: true,
                  uniqueness: { scope: :user_id }

  scope :date_order_desc, -> { order(date: :desc) }
end
