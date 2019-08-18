class CargoCarriage < Carriage
  attr_reader :capacity, :taken_capacity

  validate :number, :presence
  validate :number, :format, CARRIAGE_NUMBER_FORMAT
  validate :capacity, :type, Integer

  def initialize(number, options = {})
    super
    @type = 'cargo'
    @taken_capacity = 0
  end

  def take_capacity(volume)
    @taken_capacity += volume if (@taken_capacity + volume) <= @capacity
  end

  def capacity_left
    @capacity - @taken_capacity
  end
end
