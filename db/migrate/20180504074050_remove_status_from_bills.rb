class RemoveStatusFromBills < ActiveRecord::Migration[5.1]
  def change
    remove_column :bills, :status, :integer
  end
end
