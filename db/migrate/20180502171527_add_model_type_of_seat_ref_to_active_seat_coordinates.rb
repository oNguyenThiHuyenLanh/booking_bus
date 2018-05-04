class AddModelTypeOfSeatRefToActiveSeatCoordinates < ActiveRecord::Migration[5.1]
  def change
    add_reference :active_seat_coordinates, :type_of_seat, foreign_key: true
  end
end
