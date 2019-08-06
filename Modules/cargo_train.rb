class CargoTrain < Train

  TRAIN_TYPE = 'cargo'

  def initialize(number, engine)
    @type = TRAIN_TYPE
    @number = number
    @carriages = []
    @engine = engine
    @speed = 0
    @@all_trains << self
    register_instance
  end
  
end
