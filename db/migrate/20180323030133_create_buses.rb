class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :number_of_seats
      t.datetime :deleted_at, index: true
      t.references :type_of_bus, index: true

      t.timestamps
    end
  end
end
