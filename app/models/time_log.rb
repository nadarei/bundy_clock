class TimeLog < ActiveRecord::Base
  belongs_to :user
  has_one :comment

  validate :unique_time_log_by_user_and_date, on: :create

  def unique_time_log_by_user_and_date
    unless TimeLog.find_by_date_and_user_id(self.date, self.user_id).nil?
      errors.add(:base, "time log must be unique by date and user")
    end
  end

  def hours
    if out
      (out - self.in) / 60 / 60
    end
  end

  def comment_text=(value)
    if comment
      comment.update_attributes comments: value
    else
      c = Comment.create time_log: self, comments: value
      self.comment = c
    end
  end
end
