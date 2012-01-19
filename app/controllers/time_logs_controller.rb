class TimeLogsController < ApplicationController
  # TODO: use current_user when auth is implemented
  # POST /time_in/user_id
  def time_in 
    @time_in = TimeLog.new(date: Date.today in: Time.now, user_id: user_id)
  end

  # PUT /time_in/user_id/edit
  def edit_in
    @time_in = TimeLog.find(date: Date.today, user_id: user_id)

  # PUT /time_out/user_id/edit
  def time_out
    @time_out = TimeLog.find(date: Date.today, user_id: user_id)
  end

end
