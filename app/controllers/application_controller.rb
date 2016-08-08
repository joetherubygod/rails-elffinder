class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def require_login
    redirect_to login_path, notice: 'nem' unless signed_in?
  end

  def require_correct_user
    redirect_to root_path, notice: 'nem, nem' unless signed_in? && (@current_user == @user)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

end
