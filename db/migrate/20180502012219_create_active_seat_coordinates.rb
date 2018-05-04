class CreateActiveSeatCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :active_seat_coordinates do |t|
      t.integer :column
      t.integer :row
      t.integer :number

      t.timestamps
    end
  end
end
