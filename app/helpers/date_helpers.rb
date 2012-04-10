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
    end_date = date.end_of_month
    end_date = Date.today  if date.end_of_month > Date.today

    (date.beginning_of_month..end_date)
  end
end
