class RemoveScheduleIdFromBookedSeat < ActiveRecord::Migration[5.1]
  def change
    remove_column :booked_seats, :schedule_id
  end
end
