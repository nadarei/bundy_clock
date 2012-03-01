class TimeLog < ActiveRecord::Base
  belongs_to :user
  has_one :comment
  #validates :time_in, { :format => %r, :on => :update }
  #validates :time_out, { :format => %r, :on => :update }
  #validates :time_out_is_after_time_in, on: :update
  #validates :time_in_is_before_time_out, on: :update

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
