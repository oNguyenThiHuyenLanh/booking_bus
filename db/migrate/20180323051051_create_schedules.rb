class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.float :price
      t.datetime :time_start
      t.integer :time_spent
      t.datetime :deleted_at, index: true
      t.references :road, index: true
      t.references :bus, index: true
      t.references :route, index: true

      t.timestamps
    end
  end
end
