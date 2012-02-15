class HomeController < ApplicationController
  def index
    if logged_in?
      @users = User.order('name')
      render action: 'index'
    else
      render action: 'home'
    end
  end

  def current_month
    if logged_in?
      @year = Date.today.year
      @month = Date.today.month
      @days = (1..(Date.civil(@year, @month, -1).day))
      @dates = @days.map { |d| Date.parse "#{@year}-#{@month}-#{d}" }
      @users = User.order('name')
      render action: 'current_month'
    else
      render action: 'home'
    end
  end

end
