class TypeOfBus < ApplicationRecord
  has_many :buses, dependent: :destroy
  has_many :seats, dependent: :destroy
end
