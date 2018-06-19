class RemoveStatusFromBill < ActiveRecord::Migration[5.1]
  def change
    remove_column :bills, :status
  end
end
