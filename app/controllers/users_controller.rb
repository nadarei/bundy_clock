class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])

    @date = params[:date].nil? ? Date.today : Date.parse(params[:date])

    @dates_of_month = (@date.beginning_of_month..@date.end_of_month)

    time_logs_of_month = @user.time_logs conditions: { date: @dates_of_month }

    @total_hours = time_logs_of_month.hours.round(2)
  end
end
