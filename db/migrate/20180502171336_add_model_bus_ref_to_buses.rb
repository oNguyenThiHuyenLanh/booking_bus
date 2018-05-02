class AddModelBusRefToBuses < ActiveRecord::Migration[5.1]
  def change
    add_reference :buses, :model_bus, foreign_key: true
  end
end
