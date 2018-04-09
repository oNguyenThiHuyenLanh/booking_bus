class SchedulesController < ApplicationController
  def index
    route_ids = Route.find_routes search_params[:origin_address],
      search_params[:destination_address]
    @schedules = Schedule.find_schedules route_ids, search_params[:date],
      search_params[:interval]
    @schedule_support = Supports::SchedulesSupport.new schedules
  end

  private

  attr_reader :schedules

  def search_params
    params.require(:search).permit :origin_address, :destination_address,
      :date, :interval
  end
end
