class Station
  
  def initialize(name)
    @name = name
    @trains = {}
  end
  
  def accept_train(train)
    @trains[type] = train
  end
  
  def trains_list

  end

  def trains_by_type
  
  end

  def send_train
  
  end

end

class Route

  def initialize(first, last)
    @route = []
    @route.first = first
    @route.last = last
  end

  def add_station(station)
  
  end

  def rem_station(station)
  
  end

  def show_route
  
  end

end

class Train
  
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

train1 = Train.new('a12', 'cargo', 30)
train2 = Train.new('f342', 'cargo', 27)
train3 = Train.new('d18', 'cargo', 31)
train4 = Train.new('d312', 'cargo', 24)
train5 = Train.new('p032', 'passenger', 25)
train6 = Train.new('g94', 'passenger', 34)
train7 = Train.new('c31', 'passenger', 30)
train8 = Train.new('h428', 'passenger', 28)
train9 = Train.new('j155', 'passenger', 29)
