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

    def create
      model_bus = ModelBus.find_by id: params[:model_id]
      if model_bus
        create_bus_and_response model_bus, params[:name]
      else
        notify "danger", t("admin.error.invalid_model")
        redirect_to new_admin_bus_path
      end
    end

    private

    attr_reader :model_buses

    def filter
      seats = params[:no_seats]
      floors = params[:no_floors]
      @model_buses = ModelBus.filter seats: seats, floors: floors
    end

    def notify type, message
      flash["#{type}"] = "#{message}"
    end

    def create_bus_and_response model_bus, name
      result = BusServices::CreateBus.new(model: model_bus, name: name).perform
      if result
        notify "success", t("admin.success.create_success")
        redirect_to admin_buses_path
      else
        notify "danger", t("admin.unsuccess.create_unsuccess")
        redirect_to new_admin_bus_path
      end
    end
  end
end
