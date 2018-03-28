class TypeOfSeat < ApplicationRecord
  has_many :seats, dependent: :destroy
end
