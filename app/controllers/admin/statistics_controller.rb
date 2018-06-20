module Admin
  class StatisticsController < BaseController
    include StatisticHelper
    before_action :check_params, only: %i(show)

    def index
      @routes = Route.all
      @list_of_year = Bill.list_of_year
    end

    def show
      render json: {data: take_data} if route_exist? params[:route_id]
    end

    private

    attr_reader :route, :data_statistic

    def take_data
      route ||= Route.find_by id: params[:route_id]
      option = params[:option]
      if option == "month"
        @data_statistic = route.statistic_by_month(params[:year].to_i)
      elsif option == "year"
        @data_statistic = route.statistic_by_year
      end
      data_statistic
    end

    def check_params
      render json: {data: false} && return unless params[:route_id] &&
                                                  params[:option] &&
                                                  params[:year]
    end

    def route_exist? id
      @route = Route.find_by id: id

      return true if route
      false
    end
  end
end
