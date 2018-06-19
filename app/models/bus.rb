class Bus < ApplicationRecord
  belongs_to :model_bus
  has_many :schedules
end
