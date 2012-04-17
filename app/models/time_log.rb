class TimeLog < ActiveRecord::Base
  LEAVE_TYPES = %w[emergency sick vacation]

  has_one :comment
  belongs_to :user

  validates :date, uniqueness: {
    scope: :user_id,
    message: "user should have only one time log per date" },
    on: :create

  def hours
    if out
      (out - self.in) / 60 / 60
    end
  end

  def set_comment_text(value, append=false)
    if comment
      new_value = if append
                    [comment_text, value].join("\n")
                  else
                    value
                  end
      comment.update_attributes comments: new_value
    else
      c = Comment.create time_log: self, comments: value
      self.comment = c
    end
  end

  def comment_text=(value)
    self.set_comment_text(value, false)
  end

  def extra_comment=(value)
    self.set_comment_text(value, true)
  end

  def user_name
    user.name
  end

  def user_email
    user.email
  end

  def comment_text
    comment && comment.comments
  end
end
