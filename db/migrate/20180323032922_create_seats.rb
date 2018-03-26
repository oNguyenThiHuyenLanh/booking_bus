class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.integer :number
      t.references :type_of_seat, index: true
      t.references :type_of_bus, index: true

      t.timestamps
    end

  end
end
