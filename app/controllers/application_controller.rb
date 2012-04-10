class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all

  helper_method :current_user, :logged_in?

  def logged_in?
    !! session[:user_id]
  end

  def current_user
    User.find(session[:user_id])  if logged_in?
  end

  def ensure_logged_in
    redirect_to root_url  unless logged_in?
  end

  # Returns the user given by the API key.
  # If no API key is given, returns the current logged in user by session.
  def current_api_user
    if params[:api_key]
      User.find_by_api_key params[:api_key]
    else
      current_user
    end
  end

  # Blocks access to anyone who is not logged in, or has sent an API key.
  def ensure_logged_in_via_api
    return render(status: :forbidden, text: "Not allowed")  unless current_api_user
  end
end
