class CargoTrain < Train

  TRAIN_TYPE = 'cargo'

  def initialize(number, engine = 'электро')
    super
    @type = TRAIN_TYPE
    @engine = engine
  end
  
end
