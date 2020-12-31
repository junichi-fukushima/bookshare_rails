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
    validates :genre_id, numericality: { other_than: 0, message: 'を選んでください' }
    validates :text
    validates :image
  end

  validates :author, presence: { message:'の部分を正しく入力してください' }
  validates :title, presence: { message:'を正しく入力してください' }

end


# ***** 個人的なメモエリア ******
# アクティブストレージ導入方法
# → https://qiita.com/hmmrjn/items/7cc5e5348755c517458a
