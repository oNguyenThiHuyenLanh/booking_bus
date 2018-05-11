class ModelBus < ApplicationRecord
  has_many :buses
  has_many :active_seat_coordinates

  validates :amount_of_seats, :number_of_floors, :number_of_rows,
    :number_of_columns, presence: true
  validates :amount_of_seats, :number_of_floors, :number_of_rows,
    :number_of_columns, numericality: {greater_than: 0}

  scope :filter_seats, ->(seats){where amount_of_seats: seats}
  scope :filter_floors, ->(floors){where number_of_floors: floors}

  accepts_nested_attributes_for :active_seat_coordinates

  class << self
    def filter params = {}
      result = ModelBus.all
      params.each do |key, value|
        result = result.send("filter_#{key}", value) if value.present?
      end
      result
    end
  end
end
