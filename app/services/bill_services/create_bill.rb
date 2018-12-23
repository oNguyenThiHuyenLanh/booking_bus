module BillServices
  class CreateBill
    def initialize params = {}
      @seats_array = params[:seats_array]
      @schedule = params[:schedule]
      @user = params[:user]
    end

    def perform
      bill = Bill.new bill_params
      if bill.save
        bill.update!(code: bill.bill_code)
        UserMailer.billing(@user, bill).deliver_now
      else
        return false
      end
    end

    private

    def booked_seats_params
      @seats_array.map{|seat| {no_of_seat: seat}}
    end

    def bill_params
      num = @seats_array.length
      {
        total_price:  num * @schedule.price,
        total_ticket: num,
        user_id: @user.id, schedule_id: @schedule.id,
        booked_seats_attributes: booked_seats_params
      }
    end
  end
end
