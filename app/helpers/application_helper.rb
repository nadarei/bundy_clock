module ApplicationHelper

  def short_time(time)
    time.in_time_zone('Beijing').strftime("%H:%M")
  end

  def long_date(date)
    date.strftime("%A, %B %e, %Y")
  end
end
