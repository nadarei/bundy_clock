# Represents everything about dates.
#
# Example
#
#   Calendar.holiday?(date)   #=> true
#   Calendar.holidays         #=> Array of dates
#     
module Calendar

  HOLIDAYS = [
               '2012-01-01', # New Year
               '2012-01-23', # Chinese New Year
               '2012-02-25', # People Power Day
               '2012-04-05', # Maundy Thursday
               '2012-04-06', # Good Friday
               '2012-04-09', # Araw ng Kagitingan
               '2012-05-01', # Labor Day
               '2012-06-12', # Independence Day
               '2012-08-20', # Eidul Fitr
               '2012-08-21', # Ninoy Aquino Day
               '2012-08-27', # National Heroes' Day
               '2012-10-26', # Eidul Adha
               '2012-11-01', # All Saint's Day
               '2012-11-02', # Special Non-working Holiday
               '2012-11-30', # Bonifacio Day
               '2012-12-25', # Christmas Day
               '2012-12-30', # Rizal Day
               '2012-12-31', # New Year's Eve
  ]

  OFF_DAYS = { 'Benj' => '1' } # Day of the week: 0..6, 0 is Sunday
  FULL_DAY = { 'Benj' => 5.0 } # Number of hours for part-timer

  extend self

  def no_work?(date)
    date = to_date(date)
    weekend?(date) || holiday?(date)
  end
  
  def holiday?(date)
    date = to_date(date)
    HOLIDAYS.include?(date)
  end

  def weekend?(date)
    date = to_date(date)
    date.saturday? || date.sunday?
  end

  def day_of_week(date)
    date = to_date(date)
    date.strftime("%w")
  end

private
  def to_date(date)
    if date.is_a?(String)
      Date.parse date
    else
      date
    end
  end
end
