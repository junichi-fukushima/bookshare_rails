class Name < ApplicationRecord
  # 【ウィザード形式】、optional: true→nillでもデーター保存可能に
  belongs_to :user, optional: true

  # バリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'はひらがな・漢字全角で入力してください' } do
    validates :last_name
    validates :first_name
  end

  validates :birth_date, presence: true

  # 全角のカタカナを使用していないか検証
  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナ全角で入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
