class CreateModelBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :model_buses do |t|
      t.integer :amount_of_seats
      
      t.timestamps
    end
  end
end
