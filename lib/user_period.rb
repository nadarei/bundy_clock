class UserPeriod
  def initialize(time_logs)
    @time_logs = time_logs
  end

  def hours
    hours = 0

    @time_logs.each do |log|
      hours += log.hours  if log.hours
    end

    hours
  end
end
