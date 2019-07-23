def station_add(train)
  puts "Выберите станцию на которой размещается поезд #{Station.items.keys}"
  station_name = gets.chomp.to_sym until Station.items.key?(station_name)
  train.arrival(Station.items[station_name])
  p "Поезд № #{train.name} прибыл на станцию #{@name}"
end

def train_input
  trains = Hash(TrainCargo.items).merge(Hash(TrainPass.items))
  puts "Выберите поезд #{trains.keys}"
  train_name = gets.chomp.to_sym until trains.key?(train_name)
  trains[train_name]
end

def train_editor
  train = train_input
  p "     Выберите операцию какую хотите выполнить с поездом #{train.name}:"
  p '     1 - прицепить вагон'
  p '     2 - отцепить вагон'
  p '     3 - показать количество вагонов'
  p '     4 - увеличить скорость'
  p '     5 - уменьшить скорость'
  p '     6 - показать скорость поезда'
  p '     7 - добавить поезд на станцию'
  p '     8 - добавить маршрут следования поезда'
  p '     9 - добавить имя компании'
  p '     0 - для выхода в главное меню'
  train_editor_operation(train)
end

def train_edit_speed_up(train)
  print 'Введите скорость на которую хотите изменить скорость: '
  speed = gets.chomp.to_i
  train.speed_up(speed)
  p "Поезд № #{train.name} увеличил скорость на #{speed} км/ч"
end

def train_edit_speed_slow(train)
  print 'Введите скорость на которую хотите изменить скорость: '
  speed = gets.chomp.to_i
  train.speed_up(speed)
  return p 'Поезд остановлен, скорость уменьшить нельзя' if train.train_speed.zero?

  train.speed_slow(speed)
  p "Поезд № #{train.name} уменьшил скорость на #{speed} км/ч"
end

def train_name(train)
  p 'Введите имя компании или введите 0 чтобы посмотреть какой компании принадлежит поезд'
  name_company = gets.chomp.to_s
  train.company_name_save(name_company) if name_company != "0"
  p "Поезд принадлежит компании #{train.company_name_show}"
end

def train_editor_operation(train)
  operation = gets.chomp.to_i
  case operation
  when 1
    train.carriages_hook
    p "К поезду № #{train.name} добавлен вагон"
  when 2
    train.carriages_unhook
    p "От поезда № #{train.name} отцеплен вагон"
  when 3
    p "В поезде № #{train.name} количество вагонов составляет - #{train.carriages_number}"
  when 4
    train_edit_speed_up(train)
  when 5
    train_edit_speed_slow(train)
  when 6
    p "Поезд № #{train.name} движется со скоростью - #{train.train_speed}"
  when 7
    station_add(train)
  when 8
    route = route_input
    station_start = station_input
    train.route_add(route, station_start)
  when 9
    train_name(train)
  end
  train_editor_operation(train) unless operation.zero?
end