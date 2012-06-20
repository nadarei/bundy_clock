class LeavesController < ApplicationController
  before_filter :ensure_logged_in, only: [:index]

  def new
    @time_log = current_user.time_logs.new
  end

  def create
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    if @time_log.new_record?
      @time_log.create params[:time_log]
    else
      @time_log.update_attributes params[:time_log]
    end

    render text: 'Leave filed'
  end

  def edit
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    respond_to do |format|
      format.js
    end
  end

  def update
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    @time_log.update_attributes params[:time_log]

    respond_to do |format|
      format.js
    end
  end
end
