module Admin
  class SchedulesController < BaseController
    include ScheduleHelper

    before_action :filter
    before_action :find_schedule, only: %i(show)

    def index
      @support = Supports::ManageSchedulesSupport.new

      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      if params[:route_id]
        list_pick
      else
        @support = Supports::ManageSchedulesSupport.new
      end
    end

    def show
    end

    def create
      @schedule = Schedule.new(schedule_params)
      if schedule.save
        flash[:success] = t "admin.success.create_success"
        redirect_to admin_schedules_path
      else
        render :new
      end
    end

    private

    attr_reader :schedule

    def list_pick
      find_route
      data = {
        origin_pick: PickAddress.list_pick_add(route.origin_id),
        destination_pick: PickAddress.list_pick_add(route.destination_id)
      }

      render json: data
    end

    def filter
      @schedules = do_filter if params[:route_ids] || params[:interval_ids]
    end

    def do_filter
      interval_ids = Interval.list_intervals params[:interval_ids]
      route_ids = Route.list_routes params[:route_ids]
      Schedule.filter_schedules route_ids, interval_ids
    end

    def find_schedule
      @schedule = Schedule.find_by id: params[:id]

      return if schedule
      flash[:danger] = t "admin.error.invalid_schedule"
      redirect_to admin_schedules_path
    end

    def schedule_params
      params.require(:schedule).permit Schedule::ATTR
    end
  end
end
