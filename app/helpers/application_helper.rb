module ApplicationHelper

  def short_time(time)
    # config.time_zone set to 'Beijing'. No 'Manila' yet in Rails. Boo!
    time.in_time_zone.strftime("%H:%M")
  end

  def long_date(time)
    time.in_time_zone.strftime("%A, %B %e, %Y")
  end
end
