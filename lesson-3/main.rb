require 'pry'
require './station.rb'
require './route.rb'
require './train.rb'
require './train_pass.rb'
require './train_cargo.rb'
require './carriage.rb'
require './carriage_pass.rb'
require './carriage_cargo.rb'

class Railways
  def initialize
    @stations = []
    @trains = []
    @train_number = nil
  end

  def input_info
    p '   Выберите операцию какую хотите выполнить:'
    p '   1 - создать станцию'
    p '   2 - создать поезд'
    p '   3 - добавить вагон к поезду'
    p '   4 - отцепить вагон от поезда'
    p '   5 - поместить поезд на станцию'
    p '   6 - показать список станций и поездов'
    p '   * для выхода нажмите любую клавишу'
  end

  def input_data
    input_info
    input_operation_number = gets.chomp.to_i
    case input_operation_number
    when 1
      station_new
    when 2
      train_new
    when 3
      carriage_add
    when 4
      carriage_del
    when 5
      train_add_station
    when 6
      info
    end
  end

  def station_new
    p 'Создание станции. Введите имя станции:'
    station_name = gets.chomp
    @stations.push(Station.new(station_name))
    p "Создана станция #{station_name}"
    input_data
  end

  def train_new
    p 'Создание поезда. Введите номер поезда:'
    train_name = gets.chomp
    p 'Выберите тип поезда:'
    p '1 - пассажирский поезд'
    p '2 - грузовой поезд'
    train_type_number = gets.chomp.to_i
    case train_type_number
    when 1
      train_type = 'пассажирский'
      @trains.push(TrainPass.new(train_name))
    when 2
      train_type = 'грузовой'
      @trains.push(TrainCargo.new(train_name))
    end
    @train_number = -1
    station_add
    p "Создан #{train_type} поезд № #{train_name}"
    input_data
  end

  def carriage_add
    input_train
    @trains[@train_number].carriages_hook
    p "К поезду № #{@trains[@train_number].train_name} добавлен вагон"
    input_data
  end

  def carriage_del
    input_train
    @trains[@train_number].carriages_unhook
    p "От поезда № #{@trains[@train_number].train_name} отцеплен вагон"
    input_data
  end

  def train_add_station
    input_train
    station_add
    input_data
  end

  def info
    @stations.each(&:list_train)
    input_data
  end

  private
  # Методы не используются в других классах и подклассах

  def input_train
    p 'Выберите поезд'
    @trains.each_with_index { |train, number| p "#{number} - #{train.train_name}" }
    @train_number = gets.chomp.to_i
  end

  def station_add
    p 'Выберите станцию на которой размещается поезд'
    @stations.each_with_index { |station, number| p "#{number} - #{station.station_name}" }
    station_number = gets.chomp.to_i
    # binding.pry
    @trains[@train_number].arrival(@stations[station_number]) if station_number <= @stations.size - 1
  end
end

Railways.new.input_data
