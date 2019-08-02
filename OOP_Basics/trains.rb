class Station
  attr_reader :name, :trains_on_station

  def initialize(name)
    @name = name
    @trains_on_station = []
  end
  
  def accept_train(train)
    @trains_on_station << train
    train.speed = 0
    train.current_station = @name #####
    puts "Поезд № #{train.number} прибыл на станцию '#{@name}'"
    puts
  end
  
  def trains_list
    puts "Все поезда на станции '#{@name}' в данный момент: "
    puts '*' * 67
    @trains_on_station.each do |train|
      if train.current_station.include?(@name)
        puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | количество вагонов: #{train.length}"
      end
    end
    puts
  end

  def trains_by_type(train_type)
    puts "Поезда типа #{train_type} на станции '#{@name}' в данный момент: "
    puts '*' * 67
    puts
    @trains_on_station.each do |train|
      if train.type.include?(train_type) #####
        puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | количество вагонов: #{train.length}"
      end
    end
    puts
  end

  def send_train(train)
    if train.route.any?
      @trains_on_station.delete(train) if @trains_on_station.include?(train)
      train.move_next
    else
      puts "Сначала необходимо задать маршрут"
    end
  end
end

class Route
  attr_reader :route

  def initialize(first_station, last_station)
    @route = []
    @route << first_station
    @route << last_station
  end

  def add_station(station)
    @route.length >= 3 ? @route.insert(-2, station) : @route.insert(1, station) #добавляем станции между начальной и конечной
  end

  def rem_station(station)
    @route.delete(station.name) if @route.include?(station.name)
  end

  def show_route
    puts "Станции на маршруте #{@route[0].name} - #{@route[-1].name}"
    @route.each_with_index { |station, i| puts "#{i + 1}. #{station.name}" }
    puts
  end

  def stations_list
    @route
  end
end

class Train
  attr_reader :number, :type
  attr_accessor :length, :speed, :current_station, :route

  def initialize(number, type, length)
    @number = number
    @type = type
    @length = length
    @speed = 0
    @route = []
  end

  def speed_up
    @speed = 60
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
    puts "Текущее количество вагонов: #{@length}"
  end

  def add_carriage
    @speed == 0 ? @length += 1 : puts("Невозможно прицепить вагон пока поезд движется")
    show_length
  end

  def rem_carriage
    @speed == 0 && @length != 0 ? @length -= 1 : puts("Невозможно отцепить вагон. Поезд не имеет вагонов, либо находится в движении")
    show_length
  end

  def get_route(route)
    @route = route.stations_list
    @current_station = @route.first
    @station_index = @route.index(@current_station)
    @next_station = @route[@station_index + 1]
    @prev_station = @route[@station_index - 1]
    
    puts "Поезд № #{@number} получил маршрут от станции #{@route.first.name} до станции #{@route.last.name}"
    sleep 1
    puts "Поезд № #{@number} направляется на станцию #{@route.first.name}"
    sleep 1
    @current_station.accept_train(self)
  end

  def near_stations
    puts "Поезд № #{@number} находится на станции #{current_station}"
    if @station_index > 0 
      puts "Предыдущая станция на маршруте - #{@route[@station_index - 1].name}"
    else
      puts "Это первая станция на маршруте"
    end
    puts "Следующая станция на маршруте - #{@route[@station_index + 1].name}"
  end

  def move 
    @route[@station_index].trains_on_station.delete(self) 
    @next_station = @route[@station_index]
    puts "Поезд № #{@number} был отправлен со станции '#{@current_station}' в сторону станции '#{@next_station.name}' "
    @prev_station, @current_station = @current_station, @next_station
    @current_station.accept_train(self)
  end
  
  def move_next
    @station_index += 1
    move
  end

  def move_prev
    @station_index -= 1
    move
  end
end

# Moscow - Spb
station1 = Station.new('Москва')
station2 = Station.new('Тверь')
station3 = Station.new('Вышний Волочек')
station4 = Station.new('Бологое-Московское')
station5 = Station.new('Окуловка')
station6 = Station.new('Малая Вишера')
station7 = Station.new('Санкт-Петербург')

# Omsk - Nobosibirsk
station8 = Station.new('Омск')
station9 = Station.new('Татарская')
station10 = Station.new('Озеро-Карачинское')
station11 = Station.new('Барабинск')
station12 = Station.new('Убинская')
station13 = Station.new('Каргат')
station14 = Station.new('Чулымская')
station15 = Station.new('Обь')
station16 = Station.new('Новосибирск')

train1 = Train.new('a127', 'cargo', 30)
train2 = Train.new('f342', 'cargo', 27)
train3 = Train.new('d180', 'cargo', 31)
train4 = Train.new('d312', 'cargo', 24)
train5 = Train.new('p032', 'passenger', 25)
train6 = Train.new('g947', 'passenger', 34)
train7 = Train.new('c316', 'passenger', 30)
train8 = Train.new('h428', 'passenger', 28)
train9 = Train.new('j155', 'passenger', 29)
train10 = Train.new('b237', 'cargo', 30)
train11 = Train.new('z317', 'cargo', 27)

route1 = Route.new(station1, station7)
route1.add_station(station2)
route1.add_station(station3)
route1.add_station(station4)
route2 = Route.new(station8, station16)
route2.add_station(station9)
route2.add_station(station10)
route2.add_station(station11)

system('clear')

train1.get_route(route1)
train2.get_route(route1)

train1.near_stations
train1.move_next
train1.near_stations
train1.move_next
train1.near_stations
train1.move_next
train1.move_prev
train1.near_stations
train1.move_prev
train1.near_stations
=begin
train2.near_stations
train2.move_next
train2.near_stations
train2.move_next
train2.near_stations
train2.move_next
train2.move_prev
train2.near_stations
train2.move_prev
train2.near_stations
=end
route1.show_route

route2.show_route

route2.rem_station(station9)

route2.show_route

#station1.accept_train(train1)
#station1.accept_train(train2)
station1.accept_train(train3)
station1.accept_train(train4)
station1.accept_train(train5)
station1.accept_train(train6)
station1.accept_train(train7)
station1.accept_train(train8)
station1.accept_train(train10)
#station1.accept_train(train11)

station1.trains_list
station1.trains_by_type('cargo')
station1.trains_by_type('passenger')


station1.send_train(train2)
station2.trains_list
station1.trains_list
station3.trains_list
station4.trains_list
station5.trains_list
