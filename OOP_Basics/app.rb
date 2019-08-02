require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'

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
#train2.get_route(route1)

train1.move_prev
train1.move_next
train1.move_next
train1.move_next
train1.move_next
train1.move_next
train1.move_next
#train1.near_stations
#station1.trains_list
#train1.move_next

=begin

station1.trains_list
station2.trains_list
#train1.near_stations
train1.move_next
station2.trains_list
station3.trains_list
#train1.near_stations
#train1.move_next
train1.move_prev
station3.trains_list
station2.trains_list
#train1.near_stations
train1.move_prev
station2.trains_list
station1.trains_list
#train1.near_stations

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

route1.show_route

route2.show_route

route2.rem_station(station9)

route2.show_route

station1.accept_train(train1)
station1.accept_train(train2)
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

train1.add_carriage
train1.rem_carriage

route1.rem_station(station1)
route1.rem_station(station10)
=end
