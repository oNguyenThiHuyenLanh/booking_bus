class BookedSeat < ApplicationRecord
  belongs_to :bill
  belongs_to :schedule
end
