class Station
  attr_reader :name, :trains_on_station, :train_type

  def initialize(name)
    @name = name
    @trains_on_station = []
  end
  
  def accept_train(train)
    @trains_on_station << train
    train.speed = 0
    train.current_station = @name
    puts "Поезд № #{train.number} прибыл но станцию '#{@name}'"
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
      if train.type.include?(train_type)
        puts "№ поезда: #{train.number} | тип поезда: '#{train.type}' | количество вагонов: #{train.length}"
      end
    end
    puts
  end

  def send_train(train)
    train.speed = 60
    @trains_on_station.delete(train)
    puts "Поезд № #{train.number} был отправлен со станции '#{@name}' в сторону станции"
    puts
  end

end

class Route

  def initialize(first, last)
    @route = []
    @route << first
    @route << last
  end

  def add_station(station)
    @route.length >= 3 ? @route.insert(-2, station) : @route.insert(1, station)

  end

  def rem_station(station)
  
  end

  def show_route
    i = 1
    @route.each do |station|
      puts "#{i}. " + station
      i += 1
    end
  end

end

class Train
  attr_reader :number, :type
  attr_accessor :length, :speed, :current_station

  def initialize(number, type, length)
    @number = number
    @type = type
    @length = length
    @speed = 0
  end

  def speed_up
    @speed = 70
  end

  def current_speed
    @speed
  end

  def brake
    @speed = 0
  end

  def show_length
    @length
  end

  def add_carriage
    @length += 1 if @speed.zero?
  end

  def rem_carriage
    @length -= 1 if @speed.zero? && !@length.zero?
  end

  def get_route(route)
  
  end
end

#Moscow-Spb
station1 = Station.new('Москва')
station2 = Station.new('Тверь')
station3 = Station.new('Вышний Волочек')
station4 = Station.new('Бологое-Московское')
station5 = Station.new('Окуловка')
station6 = Station.new('Малая Вишера')
station7 = Station.new('Санкт-Петербург')

#Omsk - Nobosibirsk
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

route1 = Route.new(station1.name, station7.name)
route2 = Route.new(station8.name, station16.name)
puts route1.show_route
puts route2.show_route
=begin
  route1.add_station(station2.name)
  puts route1.show_route
  route1.add_station(station3.name)
  puts route1.show_route
  route1.add_station(station4.name)
  puts route1.show_route
=end
station1.accept_train(train1)
station1.accept_train(train2)
station1.accept_train(train3)
station1.accept_train(train4)
station1.accept_train(train5)
station1.accept_train(train6)
station1.accept_train(train7)
station1.accept_train(train8)

#puts station1.trains_on_station

#station1.trains_by_type('cargo')
station1.trains_list

#puts train1.current_station
station1.send_train(train1)
station1.trains_list