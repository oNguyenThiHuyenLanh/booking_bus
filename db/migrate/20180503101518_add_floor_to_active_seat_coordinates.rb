class AddFloorToActiveSeatCoordinates < ActiveRecord::Migration[5.1]
  def change
    add_column :active_seat_coordinates, :floor, :integer
  end
end
