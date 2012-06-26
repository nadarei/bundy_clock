class LeavesController < ApplicationController
  before_filter :ensure_logged_in, only: [:index]

  def new
    @time_log = current_user.time_logs.new
  end

  #TODO: create route for below
  def leave_type
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    respond_to do |format|
      format.js
    end
  end

  def create
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])
    @time_log.attributes = params[:time_log]

    if @time_log.save || @time_log.update
      flash[:notice] = "Leave successfully filed"
    else
      flash[:error] = "New leave not filed"
    end
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
