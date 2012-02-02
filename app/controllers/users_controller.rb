class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @period = UserPeriod.new(@user.time_logs)

    @total_hours = @period.hours
  end
end
