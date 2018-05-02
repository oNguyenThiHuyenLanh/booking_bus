class ActiveSeatCoordinate < ApplicationRecord
  belongs_to :model_bus
  belongs_to :type_of_seat
end
