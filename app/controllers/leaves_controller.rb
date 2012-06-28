class LeavesController < ApplicationController
  before_filter :ensure_logged_in, only: [:index]

  def new
    @time_log = current_user.time_logs.new
  end

  def leave_type
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    respond_to do |format|
      format.js
    end
  end

  def create
    @time_log = current_user.time_logs.find_or_initialize_by_date(params[:date])

    if @time_log.update_attributes params[:time_log]
      flash[:notice] = @time_log.id_changed? ? "New leave filed" : "Leave updated"
      redirect_to root_url
      #redirect_to user_path(current_user), date: params[:date]
    else
      render :new
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
