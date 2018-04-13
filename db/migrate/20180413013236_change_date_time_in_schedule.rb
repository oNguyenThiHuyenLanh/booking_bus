class ChangeDateTimeInSchedule < ActiveRecord::Migration[5.1]
  def change
    change_column :schedules, :time_start, :string
    add_column :schedules, :date, :date
  end
end
