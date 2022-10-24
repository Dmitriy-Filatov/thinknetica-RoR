class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  def authenticate_user!
    unless current_user
      redirect_to login_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
