# Example
#
#   u = User.find_by_email('benj@nadarei.co')
#
#   u.name    #=> "Benj"
#   u.email   #=> "benj@nadarei.co"
#
#   u.on_leave?(today)    #=> true
#
class User < ActiveRecord::Base

  validates :name, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true

  has_many :time_logs, order: :date do
    def hours
      hours = 0
      self.each {|log| hours += log.hours if log.hours}
      hours
    end
  end

  include Calendar

  def time_log_for(date=Date.today)
    # self.time_logs.where(date: date).first
    self.time_logs.find_by_date(date)
  end

  def timed_in?(date)
    log = time_log_for(date)
    log && log.in
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

  def absent_or_half_day?(date)
    log = time_log_for(date)
    if log.nil?
      !( no_work?(date) || off_day?(date) )
    else
      half_day?(date)
    end
  end

  def half_day?(date)
    log = time_log_for(date)
    return false if no_work?(date) || off_day?(date)
    return true if log.hours.nil?
    required_hours = FULL_DAY[self.name] || 8
    log.hours < required_hours/2
  end

  def off_day?(date)
    off_day = OFF_DAYS[self.name]
    day_of_week(date) == off_day
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

  before_create :generate_api_key
  def generate_api_key(force=true)
    return  if self.api_key && !force
    self.api_key = "%064x" % rand(2**256)
  end

end
