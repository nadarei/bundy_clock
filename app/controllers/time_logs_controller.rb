class TimeLogsController < ApplicationController
  # POST /time_logs/time_in
  def time_in 
    # TODO: use auth later to pass user_id
    @user = User.find(params[:user_id])
    @user.time_logs.create(date: Date.today, in: Time.now)

    redirect_to '/'
  end

  # PUT /time_logs/update
  def update
    current_time_log = TimeLog.find(params[:time_log_id])
    current_time_log.update_attributes in: params[:time]

    Comment.create time_log: current_time_log, comments: params[:comment]

    redirect_to '/'
  end

  # PUT /time_logs/time_out
  def time_out
    current_time_log = TimeLog.find(params[:time_log_id])
    current_time_log.update_attributes out: Time.now

    redirect_to '/'
  end

end
