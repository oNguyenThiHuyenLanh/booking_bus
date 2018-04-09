class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  has_many :booked_seats
  has_many :bills, through: :booked_seats
end
