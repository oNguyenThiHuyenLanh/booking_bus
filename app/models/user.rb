class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :bills
  enum role: [:guest, :customer, :employee, :manager, :admin]

  def bill_list
    data = bills.joins(schedule: :route).pluck("bills.id", "routes.origin_id",
      "routes.destination_id", :date, :time_start, :total_price)
    data.each do |item|
      item[1] = Address.find_by(id: item[1]).city
      item[2] = Address.find_by(id: item[2]).city
    end
    name_element data
  end

  private

  def name_element data
    data.map do |item|
      {
        bill_id: item[0],
        origin_address: item[1],
        destination_address: item[2],
        date: item[3],
        time: item[4],
        total_price: item[5]
      }
    end
  end
end
