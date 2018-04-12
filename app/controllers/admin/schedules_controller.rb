module Admin
  class SchedulesController < BaseController
    before_action :filter
    attr_reader :road_ids

    def index
      @support = Supports::ManageSchedulesSupport.new

      respond_to do |format|
        format.html
        format.js
      end
    end

    private

    def filter
      p_road_ids = params[:road_ids]
      p_interval_ids = params[:interval_ids]
      @schedules = do_filter(p_road_ids, p_interval_ids) if p_road_ids ||
                                                            p_interval_ids
    end

    def do_filter *param_road_ids, param_interval_ids
      @road_ids = param_road_ids
      interval_ids = Interval.list_intervals param_interval_ids
      route_ids = Road.list_routes road_ids
      Schedule.list_schedules route_ids, interval_ids
    end
  end
end
