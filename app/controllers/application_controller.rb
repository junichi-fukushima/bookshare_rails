class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname,  
        :last_name_kana,:first_name_kana,:birth_date,:email])
    end
end

