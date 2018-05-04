class RemoveTypeOfBusIdFromBuses < ActiveRecord::Migration[5.1]
  def change
    remove_column :buses, :type_of_bus_id, :integer
  end
end
