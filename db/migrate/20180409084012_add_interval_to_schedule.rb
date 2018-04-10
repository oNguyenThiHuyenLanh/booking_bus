class AddIntervalToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :interval_id, :string
  end
end
