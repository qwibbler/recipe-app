class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  before_action :update_allowed_params, if: :devise_controller?

  protected

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
