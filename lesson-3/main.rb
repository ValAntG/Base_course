require 'pry'
require './station.rb'
require './route.rb'
require './train.rb'
require './train_pass.rb'
require './train_cargo.rb'
require './carriage.rb'
require './carriage_pass.rb'
require './carriage_cargo.rb'

stations = []
trains = []

def input_info
  p '   Выберите операцию какую хотите выполнить:'
  p '   1 - создать станцию'
  p '   2 - создать поезд'
  p '   3 - добавить вагон к поезду'
  p '   4 - отцепить вагон от поезда'
  p '   5 - поместить поезд на станцию'
  p '   6 - показать список станций и поездов'
  p '   7 - показать список поездов по типу на станциях'
  p '   0 - для выхода'
end

def station_new(stations)
  print 'Создание станции. Введите имя станции: '
  station_name = gets.chomp
  stations.push(Station.new(station_name))
  p "Создана станция #{station_name}"
end

def train_new(stations, trains)
  print 'Создание поезда. Введите номер поезда: '
  train_name = gets.chomp
  p 'Выберите тип поезда:'
  p '0 - пассажирский поезд (по умолчанию)'
  p '1 - грузовой поезд'

  train_type_number = gets.chomp.to_i
  case train_type_number
  when 0
    train_type = 'пассажирский'
    train = TrainPass.new(train_name)
  when 1
    train_type = 'грузовой'
    train = TrainCargo.new(train_name)
  end
  trains.push(train)
  station_add(stations, train)
  p "Создан #{train_type} поезд № #{train_name}"
end

def station_add(stations, train)
  p "Выберите станцию на которой размещается поезд (по умолчанию - #{stations[0].station_name}): "
  stations.each_with_index { |station, number| p "#{number} - #{station.station_name}" }
  station_number = gets.chomp.to_i
  train.arrival(stations[station_number]) if station_number <= stations.size - 1
end

def input_train(trains)
  p 'Выберите поезд'
  trains.each_with_index { |train, number| p "#{number} - #{train.train_name}" }
  train_number = gets.chomp.to_i
  trains[train_number]
end

def carriage_add(trains)
  train = input_train(trains)
  train.carriages_hook
  p "К поезду № #{train.train_name} добавлен вагон"
end

def carriage_del(trains)
  train = input_train(trains)
  train.carriages_unhook
  p "От поезда № #{train.train_name} отцеплен вагон"
end

def train_add_station(stations, trains)
  train = input_train(trains)
  station_add(stations, train)
end

def train_info(trains)
  p 'Список поездов:'
  trains.each do |train|
    type = 'пассажирский' if train.train_type == 'pass'
    type = 'грузовй' if train.train_type == 'cargo'
    print "Поезд #{type} № #{train.train_name}   "
    print "с кол-вом вагонов #{train.train_carriages.size}   "
    p "находится на станции #{train.current_station.station_name}"
  end
end

loop do
  input_info
  input_operation_number = gets.chomp.to_i
  case input_operation_number
  when 1
    station_new(stations)
  when 2
    train_new(stations, trains)
  when 3
    carriage_add(trains)
  when 4
    carriage_del(trains)
  when 5
    train_add_station(stations, trains)
  when 6
    stations.each(&:list_train)
  when 7
    stations.each(&:list_by_type)
  when 8
    train_info(trains)
  when 0
    break
  end
end
