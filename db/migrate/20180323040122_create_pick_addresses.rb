class CreatePickAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :pick_addresses do |t|
      t.string :name
      t.integer :time_from_address
      t.references :address, index: true

      t.timestamps
    end
  end
end
