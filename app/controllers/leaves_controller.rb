class LeavesController < ApplicationController

  def create
    @time_log = TimeLog.create user_id: params[:user_id], date: params[:date] 

    respond_to do |format|
      format.js { render :create }
    end
  end

  def edit
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      format.js { render :create }
    end
  end

  def update
    @time_log = TimeLog.find(params[:id])

    @time_log.update_attributes params[:time_log]

    respond_to do |format|
      format.js { render :update }
    end
  end
end
