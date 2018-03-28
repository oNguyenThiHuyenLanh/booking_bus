class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.float :total_price
      t.integer :total_ticket
      t.integer :status
      t.references :user, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
