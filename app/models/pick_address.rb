class PickAddress < ApplicationRecord
  belongs_to :address

  has_many :routes, through: :route_pick_addresses
end
