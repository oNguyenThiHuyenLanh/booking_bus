class ModelBus < ApplicationRecord
  has_many :buses
  has_many :active_seat_coordinates
end
