class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @intervals = Interval.all
  end
end
