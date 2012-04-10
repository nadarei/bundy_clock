module ApplicationHelper

  def today
    Time.zone.now.to_date
  end

  # Sets the current highlighted section.
  def section(section)
    @section = section
  end

  def short_time(time)
    # config.time_zone set to 'Beijing'. No 'Manila' yet in Rails. Boo!
    time.in_time_zone.to_s(:time)
  end

  # Returns the HTML ID for the <tr> for a time log.
  def row_id(date, user)
    datestr = date.strftime("%Y%m%d")
    "log-#{datestr}-#{user.id}"
  end

end
