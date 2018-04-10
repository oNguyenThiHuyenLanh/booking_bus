class RemoveRoadFromSchedule < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:schedules, :road, index: true)
  end
end
