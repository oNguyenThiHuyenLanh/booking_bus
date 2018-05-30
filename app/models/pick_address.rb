class PickAddress < ApplicationRecord
  belongs_to :address

  has_many :routes, through: :route_pick_addresses
  scope :list_pick_add, ->(add_id){where address_id: add_id}
end
