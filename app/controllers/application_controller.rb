class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:admission_status, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :tel, :postcode, :address])

  end
end
