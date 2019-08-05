class CargoTrain < Train

  TRAIN_TYPE = 'cargo'

  def initialize(number, engine)
    @type = TRAIN_TYPE
    @number = number
    @carriages = []
    @engine = engine
    @speed = 0
  end
  
end
