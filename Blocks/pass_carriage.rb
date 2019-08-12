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
