class AddScheduleRefToBills < ActiveRecord::Migration[5.1]
  def change
    add_reference :bills, :schedule, foreign_key: true
  end
end
