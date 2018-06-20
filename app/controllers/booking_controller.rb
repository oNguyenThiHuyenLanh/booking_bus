class BookingController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new; end

  def create
    seats_array = take_seat_data
    @schedule = Schedule.find_by id: params[:schedule_id]
    if schedule && !schedule.seats_existed(seats_array)
      create_bill_and_respond
    else
      render json: {status: false}
    end
  end

  private

  attr_reader :schedule

  def bill_params
    {
      seats_array: take_seat_data,
      schedule: schedule,
      user: current_user
    }
  end

  def create_bill_and_respond
    result = BillServices::CreateBill.new(bill_params).perform
    if result
      render json: {status: true}
    else
      render json: {status: false}
    end
  end

  def take_seat_data
    params[:seats].try :map, &:to_i
  end
end
