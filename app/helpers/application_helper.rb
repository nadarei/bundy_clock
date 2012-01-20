module ApplicationHelper
  def hello
    "is it me youre looking for"
  end

  def short_time(time)
    time.localtime.strftime("%I:%M%p")
  end

  def long_date(date)
    date.strftime("%A, %B %e, %Y")
  end
end
