class RemoveBillIdFromBookedSeats < ActiveRecord::Migration[5.1]
  def change
    remove_column :booked_seats, :bill_id, :integer
  end
end
