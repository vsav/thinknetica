class PassengerTrain < Train

  TRAIN_TYPE = 'passenger'

  def initialize(number, range)
    @type = TRAIN_TYPE
    @number = number
    @carriages = []
    @range = range
    @speed = 0
    @@all_trains[self.number] = self
    register_instance
  end

end
