require 'pry'
require 'colorize'
require './company_name.rb'
require './instance_counter.rb'
require './object_block.rb'
require './validation.rb'
require './acessors.rb'
require './station.rb'
require './train.rb'
require './route.rb'
require './train_pass.rb'
require './train_cargo.rb'
require './carriage.rb'
require './carriage_pass.rb'
require './carriage_cargo.rb'
require './menu_create.rb'
require './menu_edit_route.rb'
require './menu_edit_carriage.rb'
require './menu_edit_train.rb'
require './menu_info.rb'
require './data.rb'

def input(hash)
  print "Выберите #{hash.keys}: ".light_blue
  name = gets.chomp.to_sym until hash.key?(name)
  hash[name]
end

def input_info
  puts '   Выберите операцию какую хотите выполнить:                         '.colorize(:green).on_blue
  puts '   1 - создать станцию                                               '.colorize(:black).on_green
  puts '   2 - создать поезд                                                 '.colorize(:black).on_green
  puts '   3 - создать маршрут                                               '.colorize(:black).on_green
  puts '   4 - поиск поезда                                                  '.colorize(:white).on_green
  puts '   5 - операция с поездом                                            '.colorize(:white).on_green
  puts '   6 - операция с маршрутом                                          '.colorize(:white).on_green
  puts '   7 - показать информацию по поездам                                '.colorize(:yellow).on_green
  puts '   8 - показать информацию по станциям, групирование поездов по типам'.colorize(:yellow).on_green
  puts '   9 - показать полную информацию по станциям                        '.colorize(:yellow).on_green
  puts '   0 - для выхода                                                    '.colorize(:green).on_blue
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
    route_new
  when 4
    print 'Введите номер поезда который надо найти: '.light_blue
    number_train = gets.chomp.to_sym
    train = TrainCargo.find(number_train) || TrainPass.find(number_train)
    puts 'Поезд не найден'.colorize(:white).on_red if train.nil?
    puts "Найден поезд № #{train.name}, количество вагонов #{train.train_carriages.size}".green unless train.nil?
  when 5
    train_editor
  when 6
    route_editor
  when 7
    trains_info
  when 8
    station_info
  when 9
    station_info_all
  when 0
    break
  end
end
