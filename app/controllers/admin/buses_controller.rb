module Admin
  class BusesController < BaseController
    def index
      @buses = Bus.all
    end
  end
end
