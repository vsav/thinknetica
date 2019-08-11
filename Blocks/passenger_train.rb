class PassengerTrain < Train

  TRAIN_TYPE = 'passenger'

  def initialize(number, range = 'пригородный')
    super
    @type = TRAIN_TYPE
    @range = range
  end

end
