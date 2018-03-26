class Bill < ApplicationRecord
  belongs_to :user

  has_many :booked_seats
  has_many :schedules, through: :booked_seats
end
