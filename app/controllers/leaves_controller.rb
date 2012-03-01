class LeavesController < ApplicationController
  def edit
    @time_log = TimeLog.find(params[:id])

    respond_to do |format|
      format.js { render action: 'edit' }
    end
  end

  def update
    time_log = TimeLog.find(params[:id])

    time_log.update_attributes params[:time_log]

    redirect_to :back
  end
end
