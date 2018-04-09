class Route < ApplicationRecord
  belongs_to :destination, foreign_key: "destination_id",
    class_name: Address.name
  belongs_to :origin, foreign_key: "origin_id", class_name: Address.name
  belongs_to :road

  has_many :schedules
  has_many :pick_addresses, through: :route_pick_addresses

  class << self
    def find_routes origin_id, destination_id
      Route.where(origin_id: origin_id,
        destination_id: destination_id).pluck :id
    end
  end
end
