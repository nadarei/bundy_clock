class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])

    @date = params[:date].nil? ? Date.today : Date.parse(params[:date])

    end_date = @date.end_of_month
    end_date = Date.today  if @date.end_of_month > Date.today

    @dates_of_month = (@date.beginning_of_month..end_date)

    time_logs_of_month = @user.time_logs conditions: { date: @dates_of_month }

    @total_hours = time_logs_of_month.hours.round(2)
  end

  def settings
    @user = current_user
  end
end
