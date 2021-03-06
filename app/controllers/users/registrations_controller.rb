# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    # sessionにsnsの情報があったら、適当なパスワードをparamsにアタッチ
    if session['devise.regist_data'] && session['devise.regist_data']['sns']
      password = Devise.friendly_token[8, 12] + '1a'
      params[:user][:password] = password
      params[:user][:password_confirmation] = password
    end

    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    # attributesでデーターを整形(ハッシュ形式にする)
    session['devise.regist_data'] ||= {}
    session['devise.regist_data'][:user] = @user.attributes
    session['devise.regist_data'][:user]['password'] = params[:user][:password]

    # nameに紐ずくインスタンスを生成する
    @name = @user.build_name
    render :new_name
  end

  def create_name
    @user = User.new(session['devise.regist_data']['user'])
    @name = Name.new(name_params)
    @sns = SnsCredential.new(session['devise.regist_data']['sns'])
    @user.build_name(@name.attributes)
    @user.sns_credentials.new(@sns.attributes)

    render :new_name and return unless @name.valid?

    @user.save
    session['devise.regist_data']['user'].clear
    session['devise.regist_data']['sns']&.clear
    sign_in(:user, @user)
  end

  private

  def name_params
    params.require(:name).permit(:first_name, :last_name, :nickname,
                                 :last_name_kana, :first_name_kana, :birth_date, :email)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
