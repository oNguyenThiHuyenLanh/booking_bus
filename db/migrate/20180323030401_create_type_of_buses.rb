class CreateTypeOfBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_buses do |t|
      t.string :name

      t.timestamps
    end
  end
end
