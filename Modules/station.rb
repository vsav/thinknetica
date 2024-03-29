class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def accept_train(train)
    @trains << train unless @trains.include?(train)
    puts "Поезд № #{train.number} прибыл на станцию '#{@name}'"
    puts
  end
  
  def trains_list
    puts "Все поезда на станции '#{@name}' в данный момент: "
    puts '*' * 67
    @trains.each do |train|
      puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | количество вагонов: #{train.carriages.size}"
    end
    puts
  end

  def trains_by_type(train_type)
    puts "Поезда типа #{train_type} на станции '#{@name}' в данный момент: "
    puts '*' * 67
    puts
    #@trains.each do |train|
    #  if train.type == train_type
    @trains.select do |train|
      train.type == train_type
      puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | количество вагонов: #{train.carriages.size}"
    end
    #end
    puts
  end

  def send_train(train)
    @trains.delete(train)
  end
end
