class Route < ApplicationRecord
  belongs_to :destination, foreign_key: "destination_id",
    class_name: Address.name
  belongs_to :origin, foreign_key: "origin_id", class_name: Address.name

  has_many :schedules
  has_many :pick_addresses, through: :route_pick_addresses
end
