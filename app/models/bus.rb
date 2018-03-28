class Bus < ApplicationRecord
  belongs_to :type_of_bus
  has_many :schedules
end
