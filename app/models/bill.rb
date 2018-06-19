class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  has_many :booked_seats

  accepts_nested_attributes_for :booked_seats
end
