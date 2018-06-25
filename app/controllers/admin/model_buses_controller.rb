module Admin
  class ModelBusesController < BaseController
    before_action :check_params, :check_amount_of_seat, only: [:create]

    def index
      @model_buses = ModelBus.all
    end

    def new; end

    def create
      model_bus = ModelBus.new model_bus_params
      return render json: {status: true} if model_bus.save
      render json: {status: false}
    end

    private

    attr_reader :seat_location

    def check_params
      render json: {status: false} unless
        check_incase_first_floor || check_incase_second_floor
    end

    def check_amount_of_seat
      @seat_location = seat_location_params
      render json: {status: false} unless seat_location_params.count ==
                                          params[:amount_of_seats].to_i
    end

    def check_incase_first_floor
      params[:list_seat_first_floor] && params[:amount_of_seats] &&
        params[:number_of_floors] && params[:number_of_rows] &&
        params[:number_of_columns]
    end

    def check_incase_second_floor
      params[:list_seat_first_floor] && params[:list_seat_second_floor] &&
        params[:amount_of_seats] && params[:number_of_floors] &&
        params[:number_of_rows] && params[:number_of_columns]
    end

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
