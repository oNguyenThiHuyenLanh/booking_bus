module Admin
  class BusesController < BaseController
    before_action :filter, only: :new

    def index
      @buses = Bus.all
    end

    def new
      @support = Supports::ManageBusesSupport.new

      respond_to do |format|
        format.html
        format.js
      end
    end

    private

    attr_reader :model_buses

    def filter
      seats = params[:no_seats]
      floors = params[:no_floors]
      @model_buses = ModelBus.filter seats: seats, floors: floors
    end
  end
end
