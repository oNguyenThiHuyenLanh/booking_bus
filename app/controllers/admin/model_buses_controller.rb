module Admin
  class ModelBusesController < BaseController
    def index
      @model_buses = ModelBus.all.page(params[:page]).per(10)
    end

    def show
      @model_bus = ModelBus.find_by id: params[:id]
      unless model_bus
        flash[:danger] = t "admin.error.invalid_model"
        redirect_to admin_model_buses_path
      end
    end

    def new; end

    def create
      model_bus = ModelBus.new model_bus_params
      if model_bus.save
        flash[:success] = "Thêm mô hình thành công"
      else
        flash[:danger] = t "admin.error.invalid_model"
      end
      redirect_to admin_model_buses_path
    end

    private

    attr_reader :seat_location, :model_bus

    def model_bus_params
      {
        amount_of_seats: params[:amount_of_seats].to_i,
        number_of_floors: params[:number_of_floors].to_i,
        number_of_rows: params[:number_of_rows].to_i,
        number_of_columns: params[:number_of_columns].to_i,
        active_seat_coordinates_attributes: seat_location_params
      }
    end

    def seat_location_params
      @seat_location ||= seat_location
      seat_location.map do |item|
        {
          column: item[1],
          row: item[0],
          number: item[2],
          type_of_seat_id: 1,
          floor: item[3]
        }
      end
    end

    def seat_location
      first_temp = params[:list_seat_first_floor].values
      second_temp = params[:list_seat_second_floor]
      if second_temp
        return first_temp.push second_temp.values
      else
        return first_temp
      end
    end
  end
end
