class AddBillToBookedSeats < ActiveRecord::Migration[5.1]
  def change
    add_reference :booked_seats, :bill, foreign_key: true
  end
end
