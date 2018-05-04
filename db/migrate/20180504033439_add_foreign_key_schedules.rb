class AddForeignKeySchedules < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :schedules, :routes
    add_foreign_key :schedules, :intervals
  end
end
