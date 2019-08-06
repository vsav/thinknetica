require_relative './manufacturer.rb'
require_relative './instance_counter.rb'
require_relative './railroad.rb'
require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './cargo_train.rb'
require_relative './carriage.rb'
require_relative './passenger_train.rb'

#system('clear')

rr = RailRoad.new
rr.seed

#rr.main_menu
system('clear')
puts "Найти поезд: "
Train.find('a127')
puts
puts "Количество экземпляров: "
puts "Route: #{Route.instances}"
puts "CargoTrain: #{CargoTrain.instances}"
puts "PassengerTrain: #{PassengerTrain.instances}"
puts "Station: #{Station.instances}"
puts
puts "Все созданные экземпляры Station"
Station.all
