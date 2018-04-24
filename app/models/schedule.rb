class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  belongs_to :start, foreign_key: "start_station_id",
    class_name: PickAddress.name
  belongs_to :final, foreign_key: "final_station_id",
    class_name: PickAddress.name

  has_many :booked_seats
  has_many :bills, through: :booked_seats

  def empty_slot
    bus.number_of_seats - booked_seats.count
  end

  class << self
    def list_schedules r_ids, i_ids
      Schedule.where route_id: r_ids, interval_id: i_ids
    end
  end
end
