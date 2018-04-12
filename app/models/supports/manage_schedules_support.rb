class Supports::ManageSchedulesSupport
  def schedules
    @schedules ||= Schedule.all
  end

  def roads
    @roads ||= Road.all
  end

  def intervals
    @intervals ||= Interval.all
  end
end
