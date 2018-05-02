class RemoveScheduleFromBookedSeats < ActiveRecord::Migration[5.1]
  def change
    remove_reference :booked_seats, :schedule
  end
end
