class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @intervals = Interval.all
    @routes = Route.all
    @addresses = Address.all
  end
end
