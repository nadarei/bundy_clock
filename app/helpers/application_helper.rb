module ApplicationHelper

  # Sets the current highlighted section.
  def section(section)
    @section = section
  end

  def short_time(time)
    # config.time_zone set to 'Beijing'. No 'Manila' yet in Rails. Boo!
    time.in_time_zone.to_s(:time)
  end

end
