class CargoCarriage < Carriage
  attr_reader :capacity, :taken_capacity
  def initialize(number, capacity)
    super
    @type = 'cargo'
    @capacity = capacity
    @taken_capacity = 0
  end

  def take_capacity(volume)
    @taken_capacity += volume if (@taken_capacity + volume) <= @capacity
  end

  def capacity_left
    @capacity - @taken_capacity
  end
end
