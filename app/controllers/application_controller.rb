class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    @current_user = User.first
  end

  def current_user
    @current_user
  end

  helper_method :current_user
end
