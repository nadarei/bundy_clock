class UsersController < ApplicationController
  def index
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])

    @total_hours = @user.time_logs.hours
  end
end
