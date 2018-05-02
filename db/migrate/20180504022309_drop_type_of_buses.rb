class DropTypeOfBuses < ActiveRecord::Migration[5.1]
  def change
    drop_table :type_of_buses
  end
end
