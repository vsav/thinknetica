module Seed
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
  
    @trains << train1 = CargoTrain.new('a1278', 'дизель')
    @trains << train2 = CargoTrain.new('f3422', 'дизель')
    @trains << train3 = CargoTrain.new('d18-23', 'дизель')
    @trains << train4 = CargoTrain.new('d3121', 'дизель')
    @trains << train5 = PassengerTrain.new('p03-29', 'пригородный')
    @trains << train6 = PassengerTrain.new('g9470', 'пригородный')
    @trains << train7 = PassengerTrain.new('c3216', 'дальнего следования')
    @trains << train8 = PassengerTrain.new('h42-91', 'дальнего следования')
    @trains << train9 = PassengerTrain.new('j15-3g', 'дальнего следования')
    @trains << train10 = CargoTrain.new('b2373', 'электро')
    @trains << train11 = CargoTrain.new('z31-7z', 'электро')
  
    @unused_carriages << carriage1 = CargoCarriage.new('c143')
    @unused_carriages << carriage2 = CargoCarriage.new('c221')
    @unused_carriages << carriage3 = CargoCarriage.new('c342')
    @unused_carriages << carriage4 = CargoCarriage.new('c475')
    @unused_carriages << carriage5 = CargoCarriage.new('c532')
    @unused_carriages << carriage6 = CargoCarriage.new('c675')
    @unused_carriages << carriage7 = PassengerCarriage.new('p012')
    @unused_carriages << carriage8 = PassengerCarriage.new('p220')
    @unused_carriages << carriage9 = PassengerCarriage.new('p039')
    @unused_carriages << carriage10 = PassengerCarriage.new('p409')
    @unused_carriages << carriage11 = PassengerCarriage.new('p564')
    @unused_carriages << carriage12 = PassengerCarriage.new('p064')
    
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
end
