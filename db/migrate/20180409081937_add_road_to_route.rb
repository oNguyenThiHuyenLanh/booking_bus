class AddRoadToRoute < ActiveRecord::Migration[5.1]
  def change
    add_reference(:routes, :road, index: true)
  end
end
