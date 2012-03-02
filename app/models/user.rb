class User < ActiveRecord::Base
  has_many :time_logs, order: :date do
    def hours
      hours = 0
      self.each {|log| hours += log.hours if log.hours}
      hours
    end
  end

  def time_log_for(date=Date.today)
    # self.time_logs.where(date: date).first
    self.time_logs.find_by_date(date)
  end

  def timed_in?(date)
    time_log_for(date)
  end

  def must_time_out?(date)
    log = time_log_for(date)
    log && !log.out
  end

  def timed_out?(date)
    log = time_log_for(date)
    log && log.out
  end
  
  def any_comments?(date=Date.today)
    log = time_log_for(date)
    log && log.comment
  end

  # Old behavior below!
  
  def current_time_log
    time_log_for Date.today
  end

  def timed_in_today?
    timed_in? Date.today
  end

  def must_time_out_today?
    must_time_out? Date.today
  end

  def timed_out_today?
    timed_out? Date.today
  end
end
