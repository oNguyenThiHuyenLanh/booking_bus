class AddRowAndColumnToModelBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :model_buses, :number_of_rows, :integer
    add_column :model_buses, :number_of_columns, :integer
  end
end
