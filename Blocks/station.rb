class Station
  include InstanceCounter
  attr_reader :name, :trains
  STATION_NAME_FORMAT = /^[а-я]{2,}\s*(-)*\d*[а-я]*\s*\d*$/i

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    register_instance
  end

  def valid?
    validate!
  rescue
    false
  end

  def accept_train(train)
    @trains << train unless @trains.include?(train)
  end

  def trains_list
    puts "Все поезда на станции '#{@name}' в данный момент: "
    puts '*' * 67
    @trains.each do |train|
      puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | " \
           "количество вагонов: #{train.carriages.size}"
    end
    puts
  end

  def trains_by_type(train_type)
    puts "Поезда типа #{train_type} на станции '#{@name}' в данный момент: "
    puts '*' * 67
    puts
    @trains.select do |train|
      train.type == train_type
      puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | " \
           "количество вагонов: #{train.carriages.size}"
    end
    puts
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train(&block)
    if block_given?
      # @trains.each { |train| yield(train) }
      @trains.each(&block)
    else
      puts 'Блок не передан'
    end
  end

  protected

  def validate!
    raise 'Название станции должно содержать хотя бы 2 буквы' unless name || name.length < 2
    raise 'Название станции имеет неправильный формат' if name !~ STATION_NAME_FORMAT

    true
  end
end
