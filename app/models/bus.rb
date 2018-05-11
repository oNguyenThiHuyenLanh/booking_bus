class Bus < ApplicationRecord
  belongs_to :model_bus
  has_many :schedules

  validates :name, presence: true, allow_blank: false

  scope :list_bus, -> (ids){where(id: ids)}
end
