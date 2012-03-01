class AddLeavesToTimelogs < ActiveRecord::Migration
  def change
    add_column :time_logs, :leave_duration, :float
    add_column :time_logs, :leave_type, :string
  end
end
