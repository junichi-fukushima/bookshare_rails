class Bookreview < ApplicationRecord
  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  # アクティブストレージ   
  has_one_attached :image

  # アソシエーション
  belongs_to :user
  has_many :comments

  # バリデーション
  with_options presence: true do
    validates :genre_id, numericality: { other_than: 0, message: 'Select' }
    validates :author, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Input correctly' }
    validates :text
    validates :image
  end
end


# ***** 個人的なメモエリア ******
# アクティブストレージ導入方法
# →　https://qiita.com/hmmrjn/items/7cc5e5348755c517458a
