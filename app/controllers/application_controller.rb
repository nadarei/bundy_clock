class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

private
  def logged_in?
    !! session[:user_id]
  end

  def current_user
    User.find(session[:user_id])  if logged_in?
  end
end
