class RailRoad
  attr_accessor :trains, :routes, :stations, :unused_carriages
  attr_reader :station

  include Seed

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @unused_carriages = []
  end

  def train_menu
    @train ||= select_train
    puts "Выбран поезд #{@train.number}"
    puts
    puts '1. Назначить маршрут'
    puts '2. Добавить вагоны к поезду'
    puts '3. Отцепить вагоны от поезда'
    puts '4. Переместить поезд'
    puts '5. Выбрать другой поезд'
    puts '0. Главное меню'
    puts
    print 'Выберите пункт меню '
    user_input = gets.chomp.to_i
    case user_input
    when 1
      accept_route
      train_menu
    when 2
      all_carriages
      print 'Выберите вагон: '
      carriage = gets.chomp.to_i
      @train.add_carriage(@unused_carriages[carriage - 1])
      train_menu
    when 3
      train_carriages
      print 'Выберите вагон: '
      carriage = gets.chomp.to_i
      @train.remove_carriage(@train.carriages[carriage - 1])
      train_menu
    when 4
      if @train.route.nil?
        puts 'Сначала назначьте маршрут'
        train_menu
      end
      loop do
        move_train_menu
        case @direction
        when 1
          @train.move_next
        when 2
          @train.move_prev
        when 0
          main_menu
          break
        end
      end
    when 5
      select_train
    when 0
      main_menu
    end
  end

  def accept_route
    all_routes
    print 'Выберите маршрут: '
    route = gets.chomp.to_i
    @train.route = (@routes[route - 1])
  end

  def select_train
    all_trains
    puts
    print 'Выберите поезд (порядковый номер) или введите 0 для возврата в главное меню: '
    user_input = gets.chomp.to_i
    puts
    if user_input.zero?
      main_menu
    else
      @train = @trains[user_input - 1]
    end
  end

  def all_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. #{train.number} | #{train.type}"
    end
  end

  def all_carriages
    @unused_carriages.each.with_index(1) do |carriage, index|
      puts "#{index}. #{carriage.number} | #{carriage.type}"
    end
  end

  def train_carriages
    @train.carriages.each.with_index(1) do |carriage, index|
      puts "#{index}. #{carriage.number} | #{carriage.type}"
    end
  end

  def all_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def create_station
    print 'Введите название для новой станции: '
    @stations << Station.new(gets.strip.capitalize)
    station_menu
  end

  def station_menu
    puts '1. Создать станцию'
    puts '2. Посмотреть список всех станций'
    puts '3. Посмотреть поезда на станции'
    puts '0. Главное меню'
    print 'Выберите пункт меню: '
    user_input = gets.chomp.to_i
    case user_input
    when 1
      create_station
      station_menu
    when 2
      all_stations
      station_menu
    when 3
      all_stations
      puts
      print 'Выберите станцию: '
      station = gets.chomp.to_i
      @stations[station - 1].trains_list
      puts
      station_menu
    when 0
      main_menu
    else
      station_menu
    end
  end

  def create_train
    begin
      print 'Введите номер поезда: (например А2312) '
      number = gets.strip
      train = Train.new(number)
      train.valid?
    rescue RuntimeError => e
      puts e.to_s
      puts 'Номер поезда должен иметь следующий формат: ' \
           'три буквы или цифры в любом порядке, необязательный дефис ' \
           'и еще 2 буквы или цифры после дефиса. '
      retry
    end
    begin
      print 'Выберите тип поезда: 1 - cargo, 2 - passenger):'
      type = gets.strip
      raise unless %w[1 2].include?(type)
    rescue StandardError => e
      puts e.to_s
      puts 'Введите 1 или 2'
      retry
    end
    begin
      if type == '1'
        puts 'Выберите тип двигателя'
        print '1 - дизель, 2 - электро: '
        choise = gets.strip
        case choise
        when 1
          engine = 'дизель'
        when 2
          engine = 'электро'
        end
        train = CargoTrain.new(number, engine)
        @trains << train if train.valid?
      elsif type == '2'
        puts 'Выберите класс поезда'
        print '1 - пригородный, 2 - дальнего следования: '
        choise = gets.strip
        case choise
        when 1
          range = 'пригородный'
        when 2
          range = 'дальнего следования'
        end
        train = PassengerTrain.new(number, range)
        @trains << train if train.valid?
      end
      raise unless %w[1 2].include?(choise)
    rescue StandardError => e
      puts e.to_s
      puts 'Введите 1 или 2'
      retry
    end
    puts "Создан поезд №#{train.number} типа #{train.type}"
    puts 'Создать еще один поезд? '
    print '1 - Создать, 0 - Главное меню: '
    choise = gets.strip
    choise == '1' ? create_train : main_menu
  end

  def move_train_menu
    puts '1. Вперед'
    puts '2. Назад'
    puts '0. Главное меню'
    puts
    print 'В какую сторону перепестить поезд? '
    @direction = gets.chomp.to_i
  end

  def route_menu
    puts '1. Создать маршрут'
    puts '2. Посмотреть список всех маршрутов'
    puts '3. Добавить станцию в маршрут'
    puts '0. Главное меню'

    print 'Выберите пункт меню: '
    user_input = gets.chomp.to_i
    case user_input
    when 0
      main_menu
    when 1
      create_route
      route_menu
    when 2
      all_routes
      route_menu
    when 3
      all_routes
      puts
      print 'Выберите маршрут '
      route = gets.chomp.to_i
      all_stations
      puts
      print 'Выберите станцию '
      station = gets.chomp.to_i
      @routes[route - 1].add_station(@stations[station - 1])
    end
    route_menu
  end

  def all_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index}. #{route.stations[0].name} - #{route.stations[-1].name}"
      puts 'Включает станции: '
      route.stations.each do |station|
        puts station.name.to_s
      end
      puts
    end
  end

  def create_route
    print 'Введите название начальной станции: '
    first_station = Station.new(gets.strip.capitalize)
    print 'Введите название конечной станции: '
    last_station = Station.new(gets.strip.capitalize)
    @routes << Route.new(first_station, last_station)
    route_menu
  end

  def main_menu
    puts 'Программа управления железнодорожной станцией'
    puts 'Выберите пункт меню, нажав соответствующую цифру'
    puts '1. Вывести информацию о поездах'
    puts '2. Вывести информацию о станциях'
    puts '3. Вывести информацию о маршрутах'
    puts '4. Создать новый поезд'
    puts '0. Выход'
    user_input = gets.chomp.to_i
    case user_input
    when 0
      puts 'Goodbye!'
      exit
    when 1
      system('clear')
      train_menu
    when 2
      system('clear')
      station_menu
    when 3
      system('clear')
      route_menu
    when 4
      create_train
    else
      main_menu
    end
  end
end
