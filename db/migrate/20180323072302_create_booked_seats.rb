class CreateBookedSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :booked_seats do |t|
      t.integer :no_of_seat
      t.integer :bill_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
