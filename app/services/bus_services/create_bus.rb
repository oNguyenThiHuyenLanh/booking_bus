module BusServices
  class CreateBus
    def initialize params = {}
      @name = params[:name]
      @model_bus = params[:model]
    end

    def perform
      bus = Bus.new name: name, model_bus_id: model_bus.id,
        number_of_seats: model_bus.amount_of_seats

      return true if bus.save
      false
    end

    private

    attr_reader :name, :model_bus
  end
end
