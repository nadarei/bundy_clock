require 'csv'

namespace :db do
  desc "Import time data from a CSV file"
  task :import => :environment do

    def convert_to_time(string)
      if string.nil?
        return nil
      else
        h, m, s = string.split(':')
        h = h.to_i
        m = m.to_i
        s = s.to_i
        Time.new(2000,1,1,h,m,s, "+08:00")
      end
    end

    CSV_FILE_PATH = File.join(File.dirname(__FILE__), "time_data.csv")
    CSV.foreach(CSV_FILE_PATH, headers:            true,
                               header_converters:  :symbol) do |line|

      next if line[:in].nil? && line[:comment].nil?

      user = User.find_by_name(line[:who])
      date = Date.parse(line[:date])
      time_in = convert_to_time(line[:in])
      time_out = convert_to_time(line[:out])
      time_log = user.time_logs.find_by_date(date)
      comment = line[:comments]

      if time_log
        time_log.update_attributes in: time_in, out: time_out
        if time_log.comment.nil?
          Comment.create time_log: time_log, comments: comment
        else
          time_log.comment.update_attributes comments: comment
        end
      else
        time_log = TimeLog.create user: user, date: date, in: time_in, out: time_out
        Comment.create time_log: time_log, comments: comment
      end
    end
  end
end
