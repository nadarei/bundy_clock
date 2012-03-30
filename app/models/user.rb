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

  # Tells if date is eligible for leave:
  # - not a holiday
  # - not a weekend
  # - logged for less than 8 hours
  #  
  def on_leave?(date)
    (Calendar.no_work?(date) || under_time?(date)) || !off_day?(date)
  end

  def under_time?(date)
    log = time_log_for(date)
    return false if log.nil?
    full_hours = ( self.name=='Benj' && 5 ) || 8
    log.hours < full_hours if log.hours
  end

  def off_day?(date)
    off_day = Calendar::OFF_DAYS[self.name]
    date.strftime("%w") == off_day
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
