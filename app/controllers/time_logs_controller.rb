class TimeLogController < ApplicationController
  # POST /time_log
  def create
    @time_log = TimeLog.new(in: Time.now)

  end
end
