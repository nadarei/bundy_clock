module ApplicationHelper

  def short_time(time)
    time.localtime.strftime("%H:%M")
  end

  def long_date(date)
    date.strftime("%A, %B %e, %Y")
  end
end
