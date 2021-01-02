class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # バリデーション
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }

  # パスワードの英数字混在を否定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は6文字以上の英数字で入力してください'

  # アソシエーション
  has_many   :bookreviews
  has_many   :likes, dependent: :destroy
  has_one    :name
  has_many   :sns_credentials

  # 最終的にuserのインスタンスを返すクラスメソッド
  # SNSと同emailのユーザが存在すればそのユーザを返す。いなければuserを作成し返す。
  def self.from_sns_credential(sns, auth)
    # snsの情報が既にDBにあった場合は、2回目以降のログインなので紐づくuserを返す
    return sns.user if sns.persisted?

    # snsの情報がDBにない場合
    # 既存ユーザへSNSサービス連携or新規ユーザ登録
    user = User.where(email: auth.info.email).first_or_initialize
    if user.persisted?
      user.sns_credentials << sns
      user.save
    else
      user.nickname = auth.info.name
    end
    user
  end
end
