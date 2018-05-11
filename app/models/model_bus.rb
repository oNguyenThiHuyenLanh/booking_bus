class ModelBus < ApplicationRecord
  has_many :buses
  has_many :active_seat_coordinates

  accepts_nested_attributes_for :active_seat_coordinates

  validates :amount_of_seats, :number_of_floors, :number_of_rows,
    :number_of_columns, presence: true
  validates :amount_of_seats, :number_of_floors, :number_of_rows,
    :number_of_columns, numericality: {greater_than: 0}
end
