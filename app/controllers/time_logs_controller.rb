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
    if params[:in_out] == 'in'
      current_time_log.update_attributes in: params[:time]
    elsif params[:in_out] == 'out'
      current_time_log.update_attributes out: params[:time]
    end

    current_comment = current_time_log.comment

    if current_comment.nil?
      Comment.create time_log: current_time_log, comments: params[:comment]
    else
      current_comment.update_attributes comments: params[:comment]
    end

    redirect_to '/'
  end

  # PUT /time_logs/time_out
  def time_out
    current_time_log = TimeLog.find(params[:time_log_id])
    current_time_log.update_attributes out: Time.now

    redirect_to '/'
  end

end
