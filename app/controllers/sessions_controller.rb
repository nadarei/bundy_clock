class SessionsController < ApplicationController
  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth_hash = request.env['omniauth.auth']

    user = User.find_by_email(auth_hash['info']['email'])

    if user
      if user.uid.nil?
        user.update_attributes uid: auth_hash['uid']
      end

      session[:user_id] = user.id

      redirect_to '/'
    else
      render text: "You're not in the system. Go away!"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
