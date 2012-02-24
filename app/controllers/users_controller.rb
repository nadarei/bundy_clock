class UsersController < ApplicationController
  def index
    redirect_to root_url
  end

  def show
    if logged_in?
      @user = User.find(params[:id])

      date = Date.today.at_beginning_of_month

      @time_logs_of_month = @user.time_logs.where(
        "date >= ? and date < ?", date, date.next_month)

      @total_hours = @user.time_logs.hours

      render action: 'show'
    else
      redirect_to root_url
    end
  end
end
