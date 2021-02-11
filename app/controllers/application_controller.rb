class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name_ue, :name_shita, :kana_ue, :kana_shita, :birthday, :encrypted_password])
  end
end
