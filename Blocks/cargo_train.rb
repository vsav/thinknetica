class CargoTrain < Train
  TRAIN_TYPE = 'cargo'

  def initialize(number, options = {})
    super
    @type = TRAIN_TYPE
    @engine = options[:engine] || 'электро'
  end
end
