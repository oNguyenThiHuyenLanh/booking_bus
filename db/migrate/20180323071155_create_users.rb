class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :email
      t.boolean :admin
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
