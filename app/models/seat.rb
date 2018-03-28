class Seat < ApplicationRecord
  belongs_to :type_of_seat
  belongs_to :type_of_bus
end
