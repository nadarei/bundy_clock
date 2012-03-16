class AddIndexDateUserIdToTimeLog < ActiveRecord::Migration
  def change
    add_index :time_logs, [:date, :user_id], unique: true 
  end
end
