class ChangeColumnInTyeOfSeats < ActiveRecord::Migration[5.1]
  def change
    rename_column :type_of_seats, :ticket_price, :bonus_price
  end
end
