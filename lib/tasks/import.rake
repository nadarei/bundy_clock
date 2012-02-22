require 'csv'

namespace :db do
  desc "Import time data from a CSV file"
  task :import => :environment do
    CSV_FILE_PATH = File.path('/Users/bpfh/proj/bundy_clock/lib/tasks/import.csv')
    CSV.foreach(CSV_FILE_PATH, headers:            true,
                               header_converters:  :symbol,
                               converters:         :date_time) do |line|
      user = User.find_by_name(line[:who])
      date = Date.parse(line[:date])
      time_in = line[:in]
      time_out = line[:out]
      time_log = user.time_logs.find_by_date(date)
      comment = "Imported from spreadsheet"

      if time_log
        time_log.update_attributes in: time_in, out: time_out
        if time_log.comment.nil?
          Comment.create time_log: time_log, comments: comment
        else
          time_log.comment.update_attributes comments: comment
        end
      else
        TimeLog.create user: user, date: date, in: time_in, out: time_out
        Comment.create time_log: time_log, comments: comment
      end
    end
  end
end
