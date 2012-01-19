class TimeLogsController < ApplicationController
  # POST /time_logs/time_in
  def time_in 
    @time_in = TimeLog.create(date: Date.today, in: Time.now, user_id: params[:user_id]) # Time.now is UTC; TODO: use auth later to pass user_id

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
