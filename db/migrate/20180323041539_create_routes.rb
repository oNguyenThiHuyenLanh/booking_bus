class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :origin, index: true
      t.references :destination, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
