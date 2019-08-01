class Station
  
  def initialize(name)
    @name = name
    @trains = {}
  end
  
  def accept_train(train)

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

