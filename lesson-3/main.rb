require 'pry'
require './company_name.rb'
require './instance_counter.rb'
require './station.rb'
require './route.rb'
require './train.rb'
require './train_pass.rb'
require './train_cargo.rb'
require './carriage.rb'
require './carriage_pass.rb'
require './carriage_cargo.rb'

def input_info
  p '   Выберите операцию какую хотите выполнить:'
  p '   1 - создать станцию'
  p '   2 - создать поезд'
  p '   3 - операция с вагонами поезда'
  p '   4 - операция со скоростью поезда'
  p '   5 - поместить поезд на станцию'
  p '   6 - показать список станций и поездов'
  p '   7 - показать список поездов по типу на станциях'
  p '   8 - показать информацию по поездам'
  p '   0 - для выхода'
end

def station_new
  print 'Создание станции. Введите имя станции: '
  station_name = gets.chomp

  Station.new(station_name)
  p "Создана станция #{station_name}"
end

def train_new
  print 'Создание поезда. Введите номер поезда: '
  train_name = gets.chomp.to_sym
  p 'Выберите тип поезда:'
  p '1 - пассажирский поезд'
  p '2 - грузовой поезд'
  train_type_number = gets.chomp.to_i until [1, 2].include?(train_type_number)
  case train_type_number
  when 1
    train_type = 'пассажирский'
    train = TrainPass.new(train_name)
  when 2
    train_type = 'грузовой'
    train = TrainCargo.new(train_name)
  end
  station_add(train)
  p "Создан #{train_type} поезд № #{train_name}"
end

def station_add(train)
  puts "Выберите станцию на которой размещается поезд #{Station.items.keys}"
  station_name = gets.chomp.to_sym until Station.items.key?(station_name)
  train.arrival(Station.items[station_name])
end

def input_train
  trains = Hash(TrainCargo.items).merge(Hash(TrainPass.items))
  puts "Выберите поезд #{trains.keys}"
  train_number = gets.chomp.to_sym until trains.key?(train_number)
  trains[train_number]
end

def carriage
  train = input_train
  p 'Выберите операцию:'
  p '1 - прицепить вагон'
  p '2 - отцепить вагон'
  p '3 - показать количество вагонов'
  operation = gets.chomp.to_i until [1, 2, 3].include?(operation)
  case operation
  when 1
    train.carriages_hook
    p "К поезду № #{train.name} добавлен вагон"
  when 2
    train.carriages_unhook
    p "От поезда № #{train.name} отцеплен вагон"
  when 3
    p "В поезде № #{train.name} количество вагонов составляет - #{train.carriages_number}"
  end
end

def speed
  train = input_train
  print 'Введите скорость на которую хотите изменить скорость (по умолчанию - 20 км/ч): '
  speed = gets.chomp.to_i ||= 20
  p 'Выберите операцию:'
  p '1 - увеличить скорость'
  p '2 - уменьшить скорость'
  p '3 - показать скорость поезда'
  operation = gets.chomp.to_i until [1, 2, 3].include?(operation)
  case operation
  when 1
    train.speed_up(speed)
    p "Поезд № #{train.name} увеличил скорость на #{speed} км/ч"
  when 2
    train.speed_slow(speed)
    p "Поезд № #{train.name} уменьшил скорость на #{speed} км/ч"
  when 3
    p "Поезд № #{train.name} двигается со скоростью - #{train.train_speed}"
  end
end

def train_add_station
  train = input_train
  station_add(train)
end

def train_info_by_type(type)
  trains = type.items ||= {}
  trains.each_value do |train|
    p "№#{train.name} с кол-вом вагонов #{train.carriages_number} находится на станции #{train.current_station.name}"
  end
end

def train_info
  p 'Список пассажирских поездов:'
  train_info_by_type(TrainPass)
  p 'Список грузовых поездов:'
  train_info_by_type(TrainCargo)
end

loop do
  input_info
  input_operation_number = gets.chomp.to_i
  case input_operation_number
  when 1
    station_new
  when 2
    train_new
  when 3
    carriage
  when 4
    speed
  when 5
    train_add_station
  when 6
    Station.items.each_value(&:list_train)
  when 7
    Station.items.each_value(&:list_by_type)
  when 8
    train_info
  when 0
    break
  end
end
