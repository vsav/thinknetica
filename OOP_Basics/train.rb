class Train
  attr_reader :number, :type
  attr_accessor :carriages, :speed, :current_station, :route

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def speed_up
    @speed += 20
    puts "Поезд № #{@number} набирает скорость до: #{@speed}"
  end

  def current_speed
    puts "Текущая скорость: #{@speed}"
  end

  def brake
    @speed = 0
    puts "Поезд № #{@number} остановлен"
  end

  def show_length
    puts "Текущее количество вагонов: #{@carriages}"
  end

  def add_carriage
    @speed == 0 ? @carriages += 1 : puts("Невозможно прицепить вагон пока поезд движется")
    puts "Вагон прицеплен"
    show_length
  end

  def rem_carriage
    @speed == 0 && @carriages > 0 ? @carriages -= 1 : puts("Невозможно отцепить вагон. Состав не содержит вагонов, либо находится в движении")
    puts "Вагон отцеплен"
    show_length
  end

  def get_route(route)
    @route = route
    @current_station = @route.stations.first
    @station_index = @route.stations.index(@current_station)
    puts "Поезд № #{@number} получил маршрут от станции #{@route.stations.first.name} до станции #{@route.stations.last.name}"
    puts "Поезд № #{@number} направляется на станцию #{@route.stations.first.name}"
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

  def move
    @current_station.trains.delete(self)
    @next_station = @route.stations[@station_index]
    puts "Поезд № #{@number} был отправлен со станции '#{@current_station.name}' в сторону станции '#{@next_station.name}' " 
    @prev_station, @current_station = @current_station, @next_station
    @current_station.accept_train(self)
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
end
