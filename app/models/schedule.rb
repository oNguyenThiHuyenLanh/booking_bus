class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  belongs_to :start, foreign_key: "start_station_id",
    class_name: PickAddress.name
  belongs_to :final, foreign_key: "final_station_id",
    class_name: PickAddress.name

  belongs_to :start, foreign_key: "start_station_id",
    class_name: PickAddress.name
  belongs_to :final, foreign_key: "final_station_id",
    class_name: PickAddress.name

  has_many :booked_seats
  has_many :bills, through: :booked_seats

  def empty_slot
    bus.number_of_seats - booked_seats.count
  end

  def booked_seats_second_floor
    seats = booked_seats.pluck(:no_of_seat)
    booked_seats = []
    seats.each do |seat|
      booked_seats << seat if seat >= Settings.slot_per_floor
    end
  end

  def booked_seats_first_floor
    seats = booked_seats.pluck(:no_of_seat)
    booked_seats = []
    seats.each do |seat|
      booked_seats << seat if seat < Settings.slot_per_floor
    end
  end

  class << self
    def find_schedules *route_ids, date, interval_id
      schedules = Schedule.where route_id: route_ids, date: date,
        interval_id: interval_id
      schedules.to_a
    end
  end
end
