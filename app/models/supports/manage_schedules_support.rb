class Supports::ManageSchedulesSupport
  def initialize(arg={})
    @page = arg[:page]
  end

  def schedules
    @schedules ||= Schedule.includes(route: [:origin, :destination]).order_by_date.page(@page).per(20)
  end

  def intervals
    @intervals ||= Interval.all
  end

  def routes
    @routes ||= Route.all.includes(:origin, :destination)
  end

  def buses
    @bus ||= Bus.all
  end

  def schedule
    @schedule ||= Schedule.new
  end
end
