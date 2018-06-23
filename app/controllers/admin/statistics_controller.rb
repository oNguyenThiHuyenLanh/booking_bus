module Admin
  class StatisticsController < BaseController
    include StatisticHelper

    def index
      @routes = Route.all
      @data = []
    end
  end
end
