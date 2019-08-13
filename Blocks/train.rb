class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :type
  attr_accessor :carriages, :speed, :current_station, :route

  TRAIN_NUMBER_FORMAT = /^[a-z\d]{3}(-)*[a-z\d]{2}$/i

  @@all_trains = {}

  def initialize(number, options = {})
    @number = number
    @carriages = []
    @speed = 0
    validate!
    @@all_trains[number] = self
    register_instance
  end

  def valid?
    validate!
  rescue
    false
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
    if @speed > 0
      puts 'Невозможно прицепить вагон пока поезд движется'
    elsif @type != carriage.type
      puts 'Тип вагона не совпадает с типом поезда'
    else
      @carriages << carriage
    end
  end

  def remove_carriage(carriage)
    if @speed > 0
      puts 'Невозможно отцепить вагон пока поезд движется'
    elsif @carriages.include? carriage
      @carriages.delete(carriage)
      puts 'Вагон отцеплен'
      show_length
    else
      puts 'Такого вагона в составе нет'
    end
  end

  def set_route(route)
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
    if @station_index.zero?
      puts 'Это первая станция маршрута'
    elsif @station_index + 1 == @route.stations.size
      puts 'Это конечная станция маршрута'
    end

    if @station_index.pozitive?
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

  def each_carriage
    if block_given?
      @carriages.each { |carriage| yield(carriage) }
    else
      puts 'Блок не передан'
    end
  end

    protected

    def move # чтобы этот метод нельзя было вызвать напрямую без проверки на начальную и конечную станции
      @current_station.trains.delete(self)
      @next_station = @route.stations[@station_index]
      @prev_station = @current_station
      @current_station = @next_station
      @current_station.accept_train(self)
    end

    def validate!
      raise 'Номер поезда не может быть пустым' unless number
      raise 'Номер поезда имеет неправильный формат' if number !~ TRAIN_NUMBER_FORMAT

      true
    end
end
