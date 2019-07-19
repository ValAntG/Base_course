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

def route_new
  print 'Введите имя маршрута: '
  route_name = gets.chomp
  route_stations = []
  puts 'После введения последней станции маршрута введите 0'
  puts "Для добавления в маршрут выберите станцию #{Station.items.keys}"
  loop do
    station_name = gets.chomp.to_sym
    break if station_name == '0'.to_sym

    route_stations.push(Station.items[station_name])
  end
  Route.new(route_name, route_stations)
end
