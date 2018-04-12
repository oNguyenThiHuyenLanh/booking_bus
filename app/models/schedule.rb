class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  has_many :booked_seats
  has_many :bills, through: :booked_seats

  class << self
    def list_schedules r_ids, i_ids
      Schedule.where route_id: r_ids, interval_id: i_ids
    end
  end
end
