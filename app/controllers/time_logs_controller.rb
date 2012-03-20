class TimeLogsController < ApplicationController

  before_filter :ensure_logged_in_via_api, only: [:index]

  # GET /time_logs
  # Returns time logs.
  #
  # You may pass `from` and `to` dates, though both are optional.
  #
  # ### Example
  #
  #     bundy.co/time_log?from=2012-03-01
  #     bundy.co/time_log?from=2012-03-01&to=2012-04-05
  #
  def index

    @time_logs = TimeLog
    @time_logs = @time_logs.where('date >= ?', Date.parse(params[:from]))  if params[:from]
    @time_logs = @time_logs.where('date <= ?', Date.parse(params[:to]))  if params[:to]
    @time_logs = @time_logs.all

    respond_to do |format|
      format.json { render json: @time_logs.to_json(methods: [:user_name, :user_email]) }
    end
  end

  # POST /time_logs/time_in
  def time_in 
    @time_log = current_user.time_logs.create date: Date.today, in: Time.now

    if @time_log.valid?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render file: 'shared/js_error' }
      end
    end
  end

  # PUT /time_logs/time_out
  def time_out
    current_user.current_time_log.update_attributes out: Time.now

    respond_to do |format|
      format.js { render :time_in }
    end
  end

  # PUT /time_logs/update -- to be deprecated
  def update
    time_log = current_user.time_log_for(params[:date])

    if params[:in_out] == 'in'
      if time_log.nil?
        time_log = TimeLog.create user: current_user, date: params[:date], in: params[:time]
      else
        time_log.update_attributes in: params[:time]
      end
    elsif params[:in_out] == 'out'
      time_log.update_attributes out: params[:time]
    end

    current_comment = time_log.comment

    if current_comment.nil?
      Comment.create time_log: time_log, comments: params[:comment]
    else
      current_comment.update_attributes comments: params[:comment]
    end

    respond_to do |format|
      format.js { render :time_in }
    end

  end

  def month
    @date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @year = @date.year
    @month = @date.month
    end_date = Date.civil(@year, @month, -1).day
    end_date = Date.today.day  if @date == Date.today
    @days = (1..end_date)
    @dates = @days.map { |d| Date.parse "#{@year}-#{@month}-#{d}" }
    @users = User.order('name')
  end

  def archive
    @users = User.order('name')
    today = Date.today
    @dates = [ today.prev_month, today, today.next_month ]
  end

end
