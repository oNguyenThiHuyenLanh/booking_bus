class CreateTypeOfSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_seats do |t|
      t.string :name
      t.float :ticket_price

      t.timestamps
    end
  end
end
