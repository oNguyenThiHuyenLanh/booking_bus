class AddReferenceToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :schedule_id, :integer, :references => "schedules"
  end
end
