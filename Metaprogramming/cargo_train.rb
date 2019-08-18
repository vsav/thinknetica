class CargoTrain < Train
  TRAIN_TYPE = 'cargo'

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  def initialize(number, options = {})
    super
    @type = TRAIN_TYPE
    @engine = options[:engine]
  end
end
