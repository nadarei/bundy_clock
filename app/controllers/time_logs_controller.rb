class TimeLogsController < ApplicationController
  # POST /time_logs/time_in
  def time_in 
    # TODO: use auth later to pass user_id
    @user = User.find(params[:user_id])
    @user.time_logs.create(date: Date.today, in: Time.now)

    redirect_to '/'
  end

  # PUT /time_logs/time_in
  def edit
  end

  # PUT /time_logs/time_out
  def time_out
    current_time_log = TimeLog.find(params[:time_log_id])
    current_time_log.update_attributes out: Time.now

    redirect_to '/'
  end

end
