class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:index]

  include DateHelpers

  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])

    @date = params[:date].nil? ? today : Date.parse(params[:date])

    @dates_of_month = range_for_month_with(@date)

    time_logs_of_month = @user.time_logs.where("date >= ? and date <= ?",
                                               @dates_of_month.begin,
                                               @dates_of_month.end)

    @total_hours = time_logs_of_month.hours
  end

  def settings
    @user = current_user
  end
end
