class Name < ApplicationRecord
  #【ウィザード形式】、optional: true→nillでもデーター保存可能に   
  belongs_to :user, optional: true

  #バリデーション   
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end

  validates :birth_date, presence: true

  
  # 全角のカタカナを使用していないか検証
  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

end
