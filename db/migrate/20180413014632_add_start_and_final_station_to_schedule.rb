class AddStartAndFinalStationToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :start_station_id, :integer, :references => "pick_addresses"
    add_column :schedules, :final_station_id, :integer, :references => "pick_addresses"
  end
end
