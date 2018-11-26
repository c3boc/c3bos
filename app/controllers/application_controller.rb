# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :warning, :danger, :info

  before_action :logout_guest

  def logout_guest
    redirect_to log_out_path, danger: 'You were logged out by an Admin' if current_user && !current_user.user?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def admin?
    current_user&.admin?
  end
  helper_method :admin?

  def user?
    current_user&.user?
  end
  helper_method :user?

  private

  def authorize
    redirect_to log_in_path, danger: 'You are not allowed to view this Page' unless current_user
  end

  def authorize_admin
    if current_user
      redirect_to root_url, danger: 'You are not allowed to view this Page' unless admin?
    else
      authorize
    end
  end
end
