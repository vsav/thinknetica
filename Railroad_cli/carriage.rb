class Carriage
  attr_reader :number, :type
  def initialize(number, type)
    @number = number
    @type = type
  end
end

class PassengerCarriage < Carriage
  def initialize(number, type = 'passenger')
    super
  end
end

class CargoCarriage < Carriage
  def initialize(number, type = 'cargo')
    super
  end
end
