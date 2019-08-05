class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station) #добавляем станции между начальной и конечной
    puts "Станция #{station.name} добавлена в маршрут"
  end

  def rem_station(station)
    if @stations[0] == station || @stations[-1] == station
      puts "Можно удалять только промежуточные станции маршрута"
    elsif @stations.include?(station)
      @stations.delete(station)
      puts "Станция #{station.name} удалена из маршрута"
    else
      puts "Такой станции на маршруте нет"
    end
  end

  def show_route
    puts "Станции на маршруте #{@stations[0].name} - #{@stations[-1].name}"
    @stations.each_with_index { |station, i| puts "#{i + 1}. #{station.name}" }
    puts
  end

  #def stations_list
  #  @stations
  #end
end
