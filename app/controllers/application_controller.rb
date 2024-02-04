class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    users_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # before_action :set_current_user

  # private

  # def set_current_user
  #   @current_user = User.first
  # end

  # attr_reader :current_user

  # helper_method :current_user
end
