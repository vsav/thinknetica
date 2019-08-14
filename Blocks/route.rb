class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) # добавляем станции между начальной и конечной
  end

  def remove_station(station)
    if [@stations[0], @stations[-1]].include?(station)
      puts 'Можно удалять только промежуточные станции маршрута'
    elsif @stations.include?(station)
      @stations.delete(station)
    else
      puts 'Такой станции на маршруте нет'
    end
  end

  def show_route
    puts "Станции на маршруте #{@stations[0].name} - #{@stations[-1].name}"
    @stations.each.with_index(1) { |station, i| puts "#{i}. #{station.name}" }
    puts
  end
end
