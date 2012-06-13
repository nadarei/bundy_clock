module DateHelpers
  include Calendar
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
    end_date = today  if date.end_of_month > today

    (date.beginning_of_month..end_date)
  end

  def range_of_months
    year_first_deployed = 2012
    starting_month = today.year == year_first_deployed ? 2 : 1
    ending_month = today.month

    (starting_month..ending_month).to_a.map do |m|
      datestr = Date::MONTHNAMES[m] + " " + today.year.to_s
      Date.parse(datestr)
    end
  end

  def today
    Time.zone.now.to_date
  end
end
