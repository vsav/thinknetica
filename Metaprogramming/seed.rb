module Seed
  def seed
    seed_stations
    seed_trains
    seed_carriages
    seed_carriages_to_trains
    seed_trains_to_stations
    seed_routes
  end

  def seed_stations
    # Msk - Spb
    @stations << @station1 = Station.new('Москва')
    @stations << @station2 = Station.new('Тверь')
    @stations << @station3 = Station.new('Вышний Волочек')
    @stations << @station4 = Station.new('Бологое-Московское')
    @stations << @station5 = Station.new('Окуловка')
    @stations << @station6 = Station.new('Малая Вишера')
    @stations << @station7 = Station.new('Санкт-Петербург')
    # Omsk - Nobosibirsk
    @stations << @station8 = Station.new('Омск')
    @stations << @station9 = Station.new('Татарская')
    @stations << @station10 = Station.new('Озеро-Карачинское')
    @stations << @station11 = Station.new('Барабинск')
    @stations << @station12 = Station.new('Убинская')
    @stations << @station13 = Station.new('Каргат')
    @stations << @station14 = Station.new('Чулымская')
    @stations << @station15 = Station.new('Обь')
    @stations << @station16 = Station.new('Новосибирск')
  end

  def seed_trains
    @trains << @train1 = CargoTrain.new('a1278', engine: 'дизель')
    @trains << @train2 = CargoTrain.new('f3422', engine: 'дизель')
    @trains << @train3 = CargoTrain.new('d18-23', engine: 'дизель')
    @trains << @train4 = CargoTrain.new('d3121', engine: 'дизель')
    @trains << @train5 = PassengerTrain.new('p03-29', range: 'пригородный')
    @trains << @train6 = PassengerTrain.new('g9470', range: 'пригородный')
    @trains << @train7 = PassengerTrain.new('c3216', range: 'дальнего следования')
    @trains << @train8 = PassengerTrain.new('h42-91', range: 'дальнего следования')
    @trains << @train9 = PassengerTrain.new('j15-3g', range: 'дальнего следования')
    @trains << @train10 = CargoTrain.new('b2373', engine: 'электро')
    @trains << @train11 = CargoTrain.new('z31-7z', engine: 'электро')
  end

  def seed_carriages
    @unused_carriages << @carriage1 = CargoCarriage.new('c143', 50)
    @unused_carriages << @carriage2 = CargoCarriage.new('c221', 50)
    @unused_carriages << @carriage3 = CargoCarriage.new('c342', 40)
    @unused_carriages << @carriage4 = CargoCarriage.new('c475', 45)
    @unused_carriages << @carriage5 = CargoCarriage.new('c532', 50)
    @unused_carriages << @carriage6 = CargoCarriage.new('c675', 40)
    @unused_carriages << @carriage7 = PassengerCarriage.new('p012', 80)
    @unused_carriages << @carriage8 = PassengerCarriage.new('p220', 90)
    @unused_carriages << @carriage9 = PassengerCarriage.new('p039', 80)
    @unused_carriages << @carriage10 = PassengerCarriage.new('p409', 80)
    @unused_carriages << @carriage11 = PassengerCarriage.new('p564', 100)
    @unused_carriages << @carriage12 = PassengerCarriage.new('p064', 100)
    @carriage1.take_capacity(30)
    @carriage2.take_capacity(20)
    @carriage3.take_capacity(35)
    @carriage4.take_capacity(32)
    @carriage5.take_capacity(26)
    15.times { @carriage7.take_seat }
    45.times { @carriage8.take_seat }
    35.times { @carriage9.take_seat }
    25.times { @carriage10.take_seat }
  end

  def seed_carriages_to_trains
    @trains[0].add_carriage(@carriage1)
    @trains[0].add_carriage(@carriage2)
    @trains[0].add_carriage(@carriage3)
    @trains[0].add_carriage(@carriage4)
    @trains[0].add_carriage(@carriage5)
    @trains[0].add_carriage(@carriage6)
    @trains[4].add_carriage(@carriage7)
    @trains[4].add_carriage(@carriage8)
    @trains[4].add_carriage(@carriage9)
    @trains[4].add_carriage(@carriage10)
    @trains[4].add_carriage(@carriage11)
    @trains[4].add_carriage(@carriage12)
  end

  def seed_trains_to_stations
    @stations[0].accept_train(trains[0])
    @stations[0].accept_train(trains[1])
    @stations[1].accept_train(trains[2])
    @stations[2].accept_train(trains[3])
    @stations[3].accept_train(trains[4])
  end

  def seed_routes
    @routes << route1 = Route.new(@station1, @station7)
    route1.add_station(@station2)
    route1.add_station(@station3)
    route1.add_station(@station4)
    @routes << route2 = Route.new(@station8, @station16)
    route2.add_station(@station9)
    route2.add_station(@station10)
    route2.add_station(@station11)
  end
end
