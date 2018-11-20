class Supports::ManageSchedulesSupport
  def schedules
    @schedules ||= Schedule.includes(route: [:origin, :destination]).order_by_date
  end

  def intervals
    @intervals ||= Interval.all
  end

  def routes
    @routes ||= Route.all
  end

  def buses
    @bus ||= Bus.all
  end

  def schedule
    @schedule ||= Schedule.new
  end
end
