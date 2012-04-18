class TimeLog < ActiveRecord::Base
  LEAVE_TYPES = %w[emergency sick vacation]

  has_many :comments
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
    self.comments.create(comments: value)
  end

  def user_name
    user.name
  end

  def user_email
    user.email
  end

  def comment_text
    if comments.any?
      comments.collect(&:comments).join("\n")
    else
      nil
    end
  end
end
