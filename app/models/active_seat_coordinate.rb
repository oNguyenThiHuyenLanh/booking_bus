class ActiveSeatCoordinate < ApplicationRecord
  belongs_to :model_bus
  belongs_to :type_of_seat

  def existed? num_of_row, num_of_col, num_of_floor
    row_existed?(num_of_row) && col_existed?(num_of_col) &&
      floor_existed?(num_of_floor)
  end

  private

  def row_existed? num_of_row
    row == num_of_row
  end

  def col_existed? num_of_col
    column == num_of_col
  end

  def floor_existed? num_of_floor
    floor == num_of_floor
  end
end
