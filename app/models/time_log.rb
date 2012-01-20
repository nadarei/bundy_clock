class TimeLog < ActiveRecord::Base
  belongs_to :user
  has_one :comment
end
