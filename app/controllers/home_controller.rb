class HomeController < ApplicationController
  def index
    @users = User.order('name')
  end
end
