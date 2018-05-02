class AddForeignKeyToBills < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :bills, :users
  end
end
