class User < ActiveRecord::Base
  has_many :time_logs

  def current_time_log
    self.time_logs.where('date = :date', { date: Date.today }).first
  end
end
