class PassengerTrain < Train
  TRAIN_TYPE = 'passenger'

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  def initialize(number, options = {})
    super
    @type = TRAIN_TYPE
    @range = options[:range]
  end
end
