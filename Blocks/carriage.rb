class Carriage
  include Manufacturer
  attr_reader :number, :type
  CARRIAGE_NUMBER_FORMAT = /^[c,p]{1}\d{3}$/i

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end
  
  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Номер вагона не может быть пустым" unless number
    raise "Номер вагона имеет неправильный формат" if number !~ CARRIAGE_NUMBER_FORMAT

    true
  end
end

class PassengerCarriage < Carriage
  attr_reader :seats, :seats_taken
  def initialize(number, seats)
    super
    @type = 'passenger'
    @seats = seats
    @seats_taken = 0
  end

  def take_seat
    @seats_taken += 1
  end

  def seats_left
    @seats -= @seats_taken
  end

end

class CargoCarriage < Carriage
  attr_reader :capacity, :taken_capacity
  def initialize(number, capacity)
    super
    @type = 'cargo'
    @capacity = capacity
    @taken_capacity = 0
  end

  def take_capacity(volume)
    @taken_capacity += volume if (taken_capacity + volume) < capacity
  end

  def capacity_left
    @capacity - @taken_capacity
  end

end
