class User < ApplicationRecord 
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  #バリデーション   
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }


  # パスワードの英数字混在を否定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は6文字以上の英数字で入力してください'
  
  
  # アソシエーション
  has_many   :bookreview
  has_one    :name

end
