class CargoTrain < Train

  TRAIN_TYPE = 'cargo'

  def initialize(number, engine = 'электро')
    @type = TRAIN_TYPE
    @number = number
    @carriages = []
    @engine = engine
    @speed = 0
    validate!
    @@all_trains[number] = self
    register_instance
  end
  
end
