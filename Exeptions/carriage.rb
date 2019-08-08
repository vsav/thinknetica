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
    raise "Номер вагона не может быть пустым" if number.nil?
    raise "Номер вагона имеет неправильный формат" if number !~ CARRIAGE_NUMBER_FORMAT
    true
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
