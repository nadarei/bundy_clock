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
  include DateHelpers

  def time_log_for(date=today)
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
  
  def any_comments?(date=today)
    log = time_log_for(date)
    log && log.comments
  end

  def working_day?(date)
    if timed_in?(date)
      true
    else
      ! no_work?(date)
    end
  end

  # Old behavior below!
  
  def current_time_log
    time_log_for today
  end

  def timed_in_today?
    timed_in? today
  end

  def must_time_out_today?
    must_time_out? today
  end

  def timed_out_today?
    timed_out? today
  end

  before_create :generate_api_key
  def generate_api_key(force=true)
    return  if self.api_key && !force
    self.api_key = "%064x" % rand(2**256)
  end

end
