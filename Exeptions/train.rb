class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :type
  attr_accessor :carriages, :speed, :current_station, :route

  TRAIN_NUMBER_FORMAT = /^[a-z\d]{3}(-)*[a-z\d]{2}$/i
  
  @@all_trains = {}

  def initialize(number)
    @number = number
    validate!
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
      puts "Невозможно прицепить вагон пока поезд движется"
    elsif @type != carriage.type
      puts "Тип вагона не совпадает с типом поезда"
    else
      @carriages << carriage
      puts "Вагон прицеплен"
      show_length
    end
  end

  def remove_carriage(carriage)
    if @speed > 0
      puts "Невозможно отцепить вагон пока поезд движется"  
    elsif @carriages.include? carriage
      @carriages.delete(carriage)
      puts "Вагон отцеплен"
      show_length
    else
      puts "Такого вагона в составе нет"
    end
  end

  def set_route(route)
    @route = route
    @current_station = @route.stations.first
    @station_index = @route.stations.index(@current_station)
    #puts "Поезд № #{@number} получил маршрут от станции #{@route.stations.first.name} до станции #{@route.stations.last.name}"
    #puts "Поезд № #{@number} направляется на станцию #{@route.stations.first.name}"
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
      puts "Поезд находится на конечной станции маршрута"
    else
      @next_station = @route.stations[@station_index + 1]
    end
  end

  def prev_station
    if first_station?
      puts "Поезд находится на начальной станции маршрута"
    else
      @prev_station = @route.stations[@station_index - 1]
    end
  end

  def near_stations
    puts "Поезд № #{@number} находится на станции #{@current_station.name}"
    if @station_index == 0
      puts "Это первая станция маршрута"
    elsif @station_index + 1 == @route.stations.size
      puts "Это конечная станция маршрута"
    end

    if @station_index > 0 
      puts "Предыдущая станция на маршруте - #{prev_station.name}"
    elsif @station_index < @route.stations.size
      puts "Следующая станция на маршруте - #{next_station.name}"
    end
  end
  
  def move_next
    if last_station?
      puts "Поезд находится на конечной станции маршрута"
    else
      @station_index += 1
      move
    end
  end

  def move_prev
    if first_station?
      puts "Поезд находится на начальной станции маршрута"
    else
      @station_index -= 1
      move
    end
  end

  def speed_up
    @speed += 20
    #puts "Поезд № #{@number} набирает скорость до: #{@speed}"
  end

  def brake
    @speed = 0
    #puts "Поезд № #{@number} остановлен"
  end

    protected #чтобы этот метод нельзя было вызвать напрямую без проверки на начальную и конечную станции

    def move 
      @current_station.trains.delete(self)
      @next_station = @route.stations[@station_index]
      #puts "Поезд № #{@number} был отправлен со станции '#{@current_station.name}' в сторону станции '#{@next_station.name}' " 
      @prev_station, @current_station = @current_station, @next_station
      @current_station.accept_train(self)
    end

    def validate!
      raise "Номер поезда не может быть пустым" if number.nil?
      raise "Номер поезда имеет неправильный формат" if number !~ TRAIN_NUMBER_FORMAT
      true
    end

end
