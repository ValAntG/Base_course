require 'pry'
require 'colorize'
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
require './menu_create.rb'
require './menu_edit_route.rb'
require './menu_edit_train.rb'
require './menu_info.rb'
require './data.rb'

def input_info
  p '   Выберите операцию какую хотите выполнить:'
  p '   1 - создать станцию'
  p '   2 - создать поезд'
  p '   3 - создать маршрут'
  p '   4 - операция с поездом'
  p '   5 - операция с маршрутом'
  p '   6 - показать информацию по поездам'
  p '   7 - показать информацию по станциям'
  p '   0 - для выхода'
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
    train_editor
  when 5
    route_editor
  when 6
    train_info
  when 7
    station_info
  when 0
    break
  end
end
