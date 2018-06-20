class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  has_many :booked_seats

  accepts_nested_attributes_for :booked_seats

  scope :group_by_date, ->{group("date(bills.created_at)")}
  scope :group_by_year, ->{group("year(bills.created_at)")}
  scope :on_year, ->(year){where("year(bills.created_at) = ?", year)}

  class << self
    def list_of_year
      Bill.all.order("year(created_at)").distinct.pluck("year(created_at)")
    end
  end
end
