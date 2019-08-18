class Carriage
  include Manufacturer
  include Validation
  attr_reader :number, :type
  CARRIAGE_NUMBER_FORMAT = /^[c,p]{1}\d{3}$/i

  validate :number, :presence
  validate :number, :format, CARRIAGE_NUMBER_FORMAT
  validate :type, String

  def initialize(number, options = {})
    @number = number
    @seats = options[:seats]
    @capacity = options[:capacity]
    validate!
  end
end
