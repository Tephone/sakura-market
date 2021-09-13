class Like < ApplicationRecord
  belongs_to :diary
  belongs_to :user
  validates :user_id, uniqueness: { scope: :diary_id }
end
