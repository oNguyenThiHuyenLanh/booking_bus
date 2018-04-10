class AddTimeperiodToPickaddressRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :route_pick_addresses, :time_from_address, :integer
  end
end
