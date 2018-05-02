class AddNumberOfFloorsToModelBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :model_buses, :number_of_floors, :integer
  end
end
