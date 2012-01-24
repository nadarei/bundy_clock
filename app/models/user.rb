class User < ActiveRecord::Base
  has_many :time_logs

  def current_time_log
    self.time_logs.where('date = :date', { date: Date.today }).first
  end

  def timed_in_today?
    current_time_log
  end

  def must_time_out_today?
    current_time_log && !current_time_log.out
  end

  def timed_out_today?
    current_time_log && current_time_log.out
  end

  def update_time?
    current_time_log && current_time_log.comment
  end

end
