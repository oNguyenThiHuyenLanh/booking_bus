class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  has_many :booked_seats
end
