class AddTimeLogIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :time_log_id, :integer
  end
end
