class CreateRoads < ActiveRecord::Migration[5.1]
  def change
    create_table :roads do |t|
      t.string :name

      t.timestamps
    end
  end
end
