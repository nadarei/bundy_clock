module DateHelpers
  # Returns a range with the start and end of the month that the given date is
  # in.
  #
  # Example:
  #
  #   range_for_month_with(Date.parse('2012-03-24'))
  #   #=> 2012-03-01 .. 2012-03-24
  #
  def range_for_month_with(date)
    return [date] if date.month > today.month
    end_date = date.end_of_month
    end_date = today  if date.end_of_month > today

    (date.beginning_of_month..end_date)
  end

  def today
    Time.zone.now.to_date
  end
end
