class ApplicationController < ActionController::Base
    # before_action :authenticate_user!, except: [:new, :create]
     before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :net_hunting_license, :trap_hunting_license, :first_class_hunting_license, :second_class_hunting_license])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :net_hunting_license, :trap_hunting_license, :first_class_hunting_license, :second_class_hunting_license])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :remember_me])
  end
end
