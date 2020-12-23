class Comment < ApplicationRecord
  # バリデーション
  validates :text, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :bookreview
end
