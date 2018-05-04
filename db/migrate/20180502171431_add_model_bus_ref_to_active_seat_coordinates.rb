class AddModelBusRefToActiveSeatCoordinates < ActiveRecord::Migration[5.1]
  def change
    add_reference :active_seat_coordinates, :model_bus, foreign_key: true
  end
end
