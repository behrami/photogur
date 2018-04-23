class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_sessions_path
    end
  end

  def ensure_user_owns_picture
    unless current_user == @picture.user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

end
