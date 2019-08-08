class PassengerTrain < Train

  TRAIN_TYPE = 'passenger'

  def initialize(number, range = 'пригородный')
    @type = TRAIN_TYPE
    @number = number
    @carriages = []
    @range = range
    @speed = 0
    validate!
    @@all_trains[number] = self
    register_instance
  end

end
