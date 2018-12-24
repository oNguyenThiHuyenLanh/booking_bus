module Admin
  class BillsController < BaseController

    before_action :find_schedule, only: %i(show)

    def index
      @bills = Bill.includes(:schedule).all
    end

    def show
    end

    private

  end
end
