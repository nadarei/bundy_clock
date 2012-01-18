class User < ActiveRecord::Base
  has_one :time_log
end
