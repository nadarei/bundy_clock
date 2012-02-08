module ApplicationHelper

  def short_time(time)
    # config.time_zone set to 'Beijing'. No 'Manila' yet in Rails. Boo!
    time.in_time_zone.strftime("%H:%M")
  end

  def long_date(time)
    time.in_time_zone.strftime("%A, %B %e, %Y")
  end

  def logged_in?
    !! session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end
end
