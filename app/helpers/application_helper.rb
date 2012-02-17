module ApplicationHelper

  def short_time(time)
    # config.time_zone set to 'Beijing'. No 'Manila' yet in Rails. Boo!
    time.in_time_zone.strftime("%H:%M")
  end

  def just_date(time)
    time.in_time_zone.strftime("%B %e, %Y")
  end

  def just_day(date)
    date.strftime("%a, %d")
  end

  def month_year(month)
    month.strftime("%B %Y")
  end

end
