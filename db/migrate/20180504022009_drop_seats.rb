class DropSeats < ActiveRecord::Migration[5.1]
  def change
    drop_table :seats
  end
end
