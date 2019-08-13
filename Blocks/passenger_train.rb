class PassengerTrain < Train
  TRAIN_TYPE = 'passenger'

  def initialize(number, options = {})
    super
    @type = TRAIN_TYPE
    @range = options[:range] || 'пригородный'
  end
end
