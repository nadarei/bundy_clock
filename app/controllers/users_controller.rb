class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])

    date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @date = date.at_beginning_of_month

    @time_logs_of_month = @user.time_logs.where(
        "date >= ? and date < ?", @date, @date.next_month)

    @total_hours = @time_logs_of_month.hours
  end
end
