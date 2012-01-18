class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.date :date
      t.time :in
      t.time :out
      t.integer :user_id

      t.timestamps
    end
  end
end
