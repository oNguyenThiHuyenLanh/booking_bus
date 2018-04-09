class Supports::SchedulesSupport
  attr_reader :schedules

  def initialize schedules
    @schedules = schedules
  end

  def first_floor
    @first_floor = [1]
  end

  def second_floor
    @second_floor = [20]
  end
end
