class Route < ApplicationRecord
  belongs_to :destination, foreign_key: "destination_id",
    class_name: Address.name
  belongs_to :origin, foreign_key: "origin_id", class_name: Address.name
  belongs_to :road

  has_many :schedules
  has_many :pick_addresses, through: :route_pick_addresses
  has_many :bills, through: :schedules

  def name
    origin.city + "-" + destination.city
  end

  def statistic_by_month year
    data_set = bills.group_by_date.on_year(year).pluck("date(bills.created_at),
      sum(total_price)")
    data_set.map do |data|
      {
        month: data[0],
        money: data[1]
      }
    end
  end

  def statistic_by_year
    data_set = bills.group_by_year.distinct.pluck("year(bills.created_at),
      sum(total_price)")
    data_set.map do |data|
      {
        year: data[0],
        money: data[1]
      }
    end
  end

  class << self
    def find_routes origin_id, destination_id
      Route.where(origin_id: origin_id,
        destination_id: destination_id).pluck :id
    end

    def list_routes ids
      ids.blank? ? Route.all.pluck(:id) : ids
    end
  end
end
