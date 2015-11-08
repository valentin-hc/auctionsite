class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  private
  def current_user
		return unless session[:current_user_id]
		@current_user ||= User.find(session[:current_user_id])
  end
  def require_login
    unless current_user
      flash["login_error"] = "Please login to access content !"
      redirect_to root_path
    end
  end
end
