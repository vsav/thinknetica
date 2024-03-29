class Train
  include Manufacturer
  include InstanceCounter
  include Accessors
  include Validation

  attr_reader :number, :type, :route
  attr_accessor :current_station, :carriages
  attr_accessor_with_history :speed
  strong_attr_accessor :color, String

  TRAIN_NUMBER_FORMAT = /^[a-z\d]{3}(-)*[a-z\d]{2}$/i
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER_FORMAT

  @@all_trains = {}

  def initialize(number, _options = {})
    @number = number
    validate!
    @carriages = []
    @speed = 0
    @@all_trains[number] = self
    register_instance
  end

  def self.find(number)
    puts @@all_trains[number]
  end

  def self.all
    puts @@all_trains.inspect
  end

  def current_speed
    puts "Текущая скорость: #{@speed}"
  end

  def show_length
    puts "Текущее количество вагонов: #{@carriages.size}"
  end

  def add_carriage(carriage)
    if @speed.positive?
      puts 'Невозможно прицепить вагон пока поезд движется'
    elsif @type != carriage.type
      puts 'Тип вагона не совпадает с типом поезда'
    else
      @carriages << carriage
    end
  end

  def remove_carriage(carriage)
    if @speed.positive?
      puts 'Невозможно отцепить вагон пока поезд движется'
    elsif @carriages.include? carriage
      @carriages.delete(carriage)
      puts 'Вагон отцеплен'
      show_length
    else
      puts 'Такого вагона в составе нет'
    end
  end

  def route=(route)
    @route = route
    @current_station = @route.stations.first
    @station_index = @route.stations.index(@current_station)
    @route.stations.first.accept_train(self)
  end

  def first_station?
    @current_station == @route.stations.first
  end

  def last_station?
    @current_station == @route.stations.last
  end

  def next_station
    if last_station?
      puts 'Поезд находится на конечной станции маршрута'
    else
      @next_station = @route.stations[@station_index + 1]
    end
  end

  def prev_station
    if first_station?
      puts 'Поезд находится на начальной станции маршрута'
    else
      @prev_station = @route.stations[@station_index - 1]
    end
  end

  def near_stations
    puts "Поезд № #{@number} находится на станции #{@current_station.name}"
    if @station_index.positive?
      puts "Предыдущая станция на маршруте - #{prev_station.name}"
    elsif @station_index < @route.stations.size
      puts "Следующая станция на маршруте - #{next_station.name}"
    end
  end

  def move_next
    if last_station?
      puts 'Поезд находится на конечной станции маршрута'
    else
      @station_index += 1
      move
    end
  end

  def move_prev
    if first_station?
      puts 'Поезд находится на начальной станции маршрута'
    else
      @station_index -= 1
      move
    end
  end

  def speed_up
    @speed += 20
  end

  def brake
    @speed = 0
  end

  def each_carriage(&block)
    if block_given?
      @carriages.each(&block)
    else
      puts 'Блок не передан'
    end
  end

  def route?
    route || puts('маршрут не назначен')
  end

  protected

  # чтобы этот метод нельзя было вызвать напрямую без проверки на начальную и конечную станции
  def move
    @current_station.trains.delete(self)
    @next_station = @route.stations[@station_index]
    @prev_station = @current_station
    @current_station = @next_station
    @current_station.accept_train(self)
  end
end
