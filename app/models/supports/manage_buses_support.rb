class Supports::ManageBusesSupport
  def model_buses
    @model_buses ||= ModelBus.all
  end

  def seats
    @number_of_seats ||=
      ModelBus.all.distinct.order(:amount_of_seats).pluck(:amount_of_seats)
      .insert(0, "")
  end

  def floors
    @number_of_floors ||=
      ModelBus.all.distinct.order(:number_of_floors).pluck(:number_of_floors)
      .insert(0, "")
  end
end
