class HomeController < ApplicationController
  def index
    if logged_in?
      @users = User.order('name')
      render action: 'index'
    else
      render action: 'home'
    end
  end
end
