class RailRoad
  attr_accessor :trains, :routes, :stations, :unused_carriages
  attr_reader :station
  
  def initialize
    @trains = []
    @routes = []
    @stations = []
    @unused_carriages = []

  end
  def seed
    # Moscow - Spb
    @stations << station1 = Station.new('Москва')
    @stations << station2 = Station.new('Тверь')
    @stations << station3 = Station.new('Вышний Волочек')
    @stations << station4 = Station.new('Бологое-Московское')
    @stations << station5 = Station.new('Окуловка')
    @stations << station6 = Station.new('Малая Вишера')
    @stations << station7 = Station.new('Санкт-Петербург')
  
    # Omsk - Nobosibirsk
    @stations << station8 = Station.new('Омск')
    @stations << station9 = Station.new('Татарская')
    @stations << station10 = Station.new('Озеро-Карачинское')
    @stations << station11 = Station.new('Барабинск')
    @stations << station12 = Station.new('Убинская')
    @stations << station13 = Station.new('Каргат')
    @stations << station14 = Station.new('Чулымская')
    @stations << station15 = Station.new('Обь')
    @stations << station16 = Station.new('Новосибирск')
  
    @trains << train1 = CargoTrain.new('a127', 'дизель')
    @trains << train2 = CargoTrain.new('f342', 'дизель')
    @trains << train3 = CargoTrain.new('d180', 'дизель')
    @trains << train4 = CargoTrain.new('d312', 'дизель')
    @trains << train5 = PassengerTrain.new('p032', 'пригородный')
    @trains << train6 = PassengerTrain.new('g947', 'пригородный')
    @trains << train7 = PassengerTrain.new('c316', 'дальнего следования')
    @trains << train8 = PassengerTrain.new('h428', 'дальнего следования')
    @trains << train9 = PassengerTrain.new('j155', 'дальнего следования')
    @trains << train10 = CargoTrain.new('b237', 'электро')
    @trains << train11 = CargoTrain.new('z317', 'электро')
  
    @unused_carriages << carriage1 = CargoCarriage.new('c1')
    @unused_carriages << carriage2 = CargoCarriage.new('c2')
    @unused_carriages << carriage3 = CargoCarriage.new('c3')
    @unused_carriages << carriage4 = CargoCarriage.new('c4')
    @unused_carriages << carriage5 = CargoCarriage.new('c5')
    @unused_carriages << carriage6 = CargoCarriage.new('c6')
    @unused_carriages << carriage7 = PassengerCarriage.new('p1')
    @unused_carriages << carriage8 = PassengerCarriage.new('p2')
    @unused_carriages << carriage9 = PassengerCarriage.new('p3')
    @unused_carriages << carriage10 = PassengerCarriage.new('p4')
    @unused_carriages << carriage11 = PassengerCarriage.new('p5')
    @unused_carriages << carriage12 = PassengerCarriage.new('p6')
    
    @stations[0].accept_train(trains[0])
    @stations[0].accept_train(trains[1])
    @stations[0].accept_train(trains[2])
    @stations[0].accept_train(trains[3])


    @routes << route1 = Route.new(station1, station7)
    route1.add_station(station2)
    route1.add_station(station3)
    route1.add_station(station4)
    @routes << route2 = Route.new(station8, station16)
    route2.add_station(station9)
    route2.add_station(station10)
    route2.add_station(station11)
  end

  def train_menu
    all_trains
    puts
    print 'Выберите поезд (порядковый номер) или введите 0 для возврата в главное меню: '
    user_input = gets.chomp.to_i
    puts
    if user_input == 0
      main_menu
    else
      @train = @trains[user_input - 1]
      puts "Выбран поезд #{@train.number}"
      puts
      puts "1. Назначить маршрут"
      puts "2. Добавить вагоны к поезду"
      puts "3. Отцепить вагоны от поезда"
      puts "4. Переместить поезд"
      puts "5. Выбрать другой поезд"
      puts "0. Главное меню"
      puts
      print "Выберите пункт меню "
      user_input = gets.chomp.to_i
      case user_input
        when 1
          all_routes
          print "Выберите маршрут: "
          route = gets.chomp.to_i
          @train.set_route(@routes[route - 1])
          train_menu
        when 2
          all_carriages
          print "Выберите вагон: "
          carriage = gets.chomp.to_i
          @train.add_carriage(@unused_carriages[carriage - 1])
          train_menu
        when 3
          train_carriages
          print "Выберите вагон: "
          carriage = gets.chomp.to_i
          @train.rem_carriage(@train.carriages[carriage - 1])
          train_menu
        when 4
          direction = ''
          until direction == 0
            unless @train.route.nil?
              move_train_menu
              direction = gets.chomp.to_i
              if direction == 1
                @train.move_next
              elsif direction == 2
                @train.move_prev
              end
            else
              puts "Сначала назначьте маршрут"
              train_menu
            end
          end
          #main_menu
        when 5
          train_menu
        when 0
          main_menu
      end
    end
  end
  
  def all_trains
    @trains.each_with_index do |train, index|
      puts "#{index + 1}. #{train.number} | #{train.type}"
    end
  end

  def all_carriages
    @unused_carriages.each_with_index do |carriage, index|
      puts "#{index + 1}. #{carriage.number} | #{carriage.type}"
    end
  end

  def train_carriages
    @train.carriages.each_with_index do |carriage, index|
      puts "#{index + 1}. #{carriage.number} - #{carriage.type}"
    end
  end

  def all_stations
    @stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
  end

  def create_station
    print "Введите название для новой станции: "
    @stations << Station.new(gets.chomp)
    station_menu
  end

  def station_menu
    user_input = ''
    until user_input == 0
      puts "1. Создать станцию"
      puts "2. Посмотреть список всех станций"
      puts "3. Посмотреть поезда на станции"
      puts "0. Главное меню"

      print 'Выберите пункт меню: '
      user_input = gets.chomp.to_i
      if user_input == 1
        create_station
        station_menu
      elsif user_input == 2
        all_stations
        station_menu
      elsif user_input == 3
        all_stations
        puts
        print "Выберите станцию: "
        station = gets.chomp.to_i
        @stations[station - 1].trains_list
        puts
        station_menu
      end
    end
    main_menu
  end

  def create_train
    print "Введите номер поезда: "
    number = gets.chomp
    print "Выберите тип поезда (cargo, passenger):"
    type = gets.chomp
      if type == 'cargo'
        print "Какого типа будет двигатель (дизель, электро)? "
        engine = gets.chomp
        @trains << CargoTrain.new(number, engine)
      elsif type == 'passenger'
        print "Пригородный или дальнего следования?: "
        range = gets.chomp
        @trains << PassengerTrain.new(number, range)
      end
    train_menu
  end

  def move_train_menu
    puts "1. Вперед"
    puts "2. Назад"
    puts "0. Главное меню"
    puts
    print "В какую сторону перепестить поезд? "
  end

  def route_menu
    puts "1. Создать маршрут"
    puts "2. Посмотреть список всех маршрутов"
    puts "3. Добавить станцию в маршрут"
    puts "0. Главное меню"

    print 'Выберите пункт меню: '
    user_input = gets.chomp.to_i
    if user_input == 0
      main_menu
    elsif user_input == 1
      create_route
      route_menu
    elsif user_input == 2
      all_routes
      route_menu
    elsif user_input == 3
      all_routes
      puts
      print "Выберите маршрут "
      route = gets.chomp.to_i
      all_stations
      puts
      print "Выберите станцию "
      station = gets.chomp.to_i
      @routes[route - 1].add_station(@stations[station - 1])
    end
    route_menu
  end

  def all_routes
    @routes.each_with_index do |route, index|
      puts "#{index + 1}. #{route.stations[0].name} - #{route.stations[-1].name}"
      puts "Включает станции: "
      route.stations.each do |station|
        puts "#{station.name}"
      end
      puts
    end
  end

  def create_route
    print "Введите название начальной станции: "
    first_station = Station.new(gets.chomp)
    print "Введите название конечной станции: "
    last_station = Station.new(gets.chomp)
    @routes << Route.new(first_station, last_station)
    route_menu
  end

  def main_menu
    system('clear')
    puts 'Программа управления железнодорожной станцией'
    puts 'Выберите пункт меню, нажав соответствующую цифру'
    puts '1. Вывести информацию о поездах'
    puts '2. Вывести информацию о станциях'
    puts '3. Вывести информацию о маршрутах'
    puts '0. Выход'
    user_input = gets.chomp.to_i
    until user_input == 0
      system('clear')
      if user_input == 1
        system('clear')
        train_menu
      elsif user_input == 2
        system('clear')
        station_menu
      elsif user_input == 3
        system('clear')
        route_menu
      else
        main_menu
      end
    end
    puts "Bye!"
    exit
  end 
end
