class TimeLogsController < ApplicationController
  # POST /time_logs/time_in
  def time_in 
    # TODO: use auth later to pass user_id
    @user = User.find(params[:user_id])
    @user.time_logs.create(date: Date.today, in: Time.now)

    redirect_to '/'
  end

  # PUT 
  def edit
    @time_in = TimeLog.find(date: Date.today, user_id: user_id)
  end

  # PUT
  def time_out
    @time_out = TimeLog.find(date: Date.today, user_id: user_id)
  end

end
