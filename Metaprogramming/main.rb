require_relative './manufacturer.rb'
require_relative './instance_counter.rb'
require_relative './accessors.rb'
require_relative './validation.rb'
require_relative './seed.rb'
require_relative './train.rb'
require_relative './railroad.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './cargo_train.rb'
require_relative './carriage.rb'
require_relative './pass_carriage.rb'
require_relative './cargo_carriage.rb'
require_relative './passenger_train.rb'

rr = RailRoad.new
rr.seed
system 'clear'

rr.trains[0].speed = 10
rr.trains[0].speed = 15
rr.trains[0].speed = 20
rr.trains[0].speed = 10
rr.trains[0].speed = 15
rr.trains[1].speed = 15
rr.trains[1].speed = 20
puts rr.trains[0].speed_history.inspect
puts rr.trains[1].speed_history.inspect

rr.trains[0].color = 'green'
begin
  rr.trains[0].color = 1
rescue RuntimeError => e
  puts e
end
s1 = Station.new('Москва')
s1.valid?
Station.new('')
rr.trains[0].valid?
Station.new('a')
Station.new(1)
CargoTrain.new('aaa')
PassengerTrain.new('')

# rr.main_menu
# rr.trains[0].route = rr.routes[0]
# rr.trains[0].near_stations
# puts "Найти поезд: "
# Train.find('a1278')
# Train.find('p03-29')
# puts
# puts "Количество экземпляров: "
# puts "Route: #{Route.instances}"
# puts "CargoTrain: #{CargoTrain.instances}"
# puts "PassengerTrain: #{PassengerTrain.instances}"
# puts "Station: #{Station.instances}"
# puts
# Station.all

=begin
rr.stations.each do |station|
  puts "Поезда на станции #{station.name}"
  puts '*' * 80
  station.each_train do |train|
    puts "Поезд № #{train.number} | тип #{train.type} | " \
         "количечство вагонов: #{train.carriages.size}"
    puts
    train.each_carriage do |carriage|
      if carriage.type == 'cargo'
        puts "Вагон № #{carriage.number} | тип #{carriage.type}  | " \
             "вместительность: #{carriage.capacity} | " \
             "загруженность: #{carriage.taken_capacity} | " \
             "доступный объем: #{carriage.capacity_left}"
      elsif carriage.type == 'passenger'
        puts "Вагон № #{carriage.number} | тип #{carriage.type} | " \
             "всего мест: #{carriage.seats} | " \
             "занято мест: #{carriage.seats_taken} | " \
             "свободных мест: #{carriage.seats_left}"
      end
    end
    puts
    puts '*' * 80
    puts
  end
  puts '*' * 80
end
=end
