# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  private

  def authorization

    auth = request.env["omniauth.auth"]
    # first_or_initialize → where文で一致していない場合新しいインスタンスを作る
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    @user = User.from_sns_credential(sns, auth)

    if @user.persisted?
      # @userがDBにいるならば: ログインしてトップページへ飛ばす
      sign_in_and_redirect @user, event: :authentication
    else
      # @userがDBにいないならば: ユーザ新規ログイン画面に遷移させる。
      # 変数がnilかfalseのみの時代入
      session["devise.regist_data"] ||= {}
      session["devise.regist_data"]["sns"] = sns.attributes
      render template: 'devise/registrations/new'
    end
  end
end
