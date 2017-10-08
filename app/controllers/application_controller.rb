class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_notification_popup

  protected

  def configure_permitted_parameters
    attrs = [:username, :avatar, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: attrs)
  end

  def set_user_notification_popup
    if user_signed_in? && current_user.notifications.present?
      @popup = current_user.notifications.unopened_only.present?
    end
  end
end
