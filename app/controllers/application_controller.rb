class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def current_user
    @current_user ||= super || find_user_by_session_username
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'You must be logged in to perform this action'
      redirect_to new_user_session_path
    end
  end

  private

  def find_user_by_session_username
    if session[:username].present?
      user = User.find_by(username: session[:username])
      if user.nil?
        session[:username] = nil
        flash[:alert] = "Your session has expired. Please log in again."
        redirect_to new_user_session_path
      end
      user
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :email])
  end
end
