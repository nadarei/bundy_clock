class HomeController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  def index
    if logged_in?
      @users = User.order('name')
      render action: 'index'
    else
      render action: 'home'
    end
  end

  def month
    @date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @year = @date.year
    @month = @date.month
    @days = (1..(Date.civil(@year, @month, -1).day))
    @dates = @days.map { |d| Date.parse "#{@year}-#{@month}-#{d}" }
    @users = User.order('name')
  end

  def archive
    @users = User.order('name')
    today = Date.today
    @dates = [ today.prev_month, today, today.next_month ]
  end
end
