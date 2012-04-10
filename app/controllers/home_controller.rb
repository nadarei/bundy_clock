class HomeController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  def index
    if logged_in?
      @users = User.order('name')
      @date = Time.zone.now.to_date
      render 'index'
    else
      render 'home'
    end
  end
end
