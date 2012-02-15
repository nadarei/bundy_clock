class TimeLogsController < ApplicationController
  # POST /time_logs/time_in
  def time_in 
    current_user.time_logs.create date: Date.today, in: Time.now

    redirect_to root_url
  end

  # PUT /time_logs/time_out
  def time_out
    current_user.current_time_log.update_attributes out: Time.now

    redirect_to root_url
  end

  # PUT /time_logs/update
  def update
    current_time_log = current_user.current_time_log

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

    redirect_to root_url
  end

end
