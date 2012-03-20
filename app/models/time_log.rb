class TimeLog < ActiveRecord::Base
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

  def comment_text=(value)
    if comment
      comment.update_attributes comments: value
    else
      c = Comment.create time_log: self, comments: value
      self.comment = c
    end
  end

  def user_name
    user.name
  end

  def user_email
    user.email
  end
end
