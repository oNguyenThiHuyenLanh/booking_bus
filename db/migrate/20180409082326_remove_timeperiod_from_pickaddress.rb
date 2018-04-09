class RemoveTimeperiodFromPickaddress < ActiveRecord::Migration[5.1]
  def change
    remove_column(:pick_addresses, :time_from_address)
  end
end
