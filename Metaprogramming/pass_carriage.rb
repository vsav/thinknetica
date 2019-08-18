class PassengerCarriage < Carriage
  attr_reader :seats, :seats_taken

  validate :number, :presence
  validate :number, :format, CARRIAGE_NUMBER_FORMAT
  validate :seats, :type, Integer

  def initialize(number, options = {})
    super
    @type = 'passenger'
    @seats_taken = 0
  end

  def take_seat
    @seats_taken += 1 if @seats_taken < @seats
  end

  def seats_left
    @seats -= @seats_taken
  end
end
