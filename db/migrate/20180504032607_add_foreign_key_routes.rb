class AddForeignKeyRoutes < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :routes, :roads
    add_foreign_key :routes, :addresses, column: :origin_id
    add_foreign_key :routes, :addresses, column: :destination_id
  end
end
