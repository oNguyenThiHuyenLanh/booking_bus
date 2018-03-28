class CreateRoutePickAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :route_pick_addresses do |t|
      t.references :route, foreign_key: true
      t.references :pick_address, foreign_key: true

      t.timestamps
    end
  end
end
