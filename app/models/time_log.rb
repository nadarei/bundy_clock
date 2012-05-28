class TimeLog < ActiveRecord::Base
  LEAVE_TYPES = %w[emergency sick vacation]

  has_many :comments
  belongs_to :user

  attr_writer :comment_text

  validates :date, uniqueness: {
    scope: :user_id,
    message: "user should have only one time log per date" },
    on: :create

  def hours
    if out
      (out - self.in) / 60 / 60
    end
  end

  def user_name
    user.name
  end

  def user_email
    user.email
  end

  def comment_text
    @comment_text ||= if comments.any?
      comments.collect(&:comments).join("\n")
    else
      nil
    end
  end

private

  after_save :create_comment_text
  def create_comment_text
    self.comments.create(comments: @comment_text) if @comment_text
  end
end
