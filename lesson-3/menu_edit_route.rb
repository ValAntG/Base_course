def station_input
  puts "Выберите станцию #{Station.items.keys}"
  station = gets.chomp.to_sym until Station.items.key?(station)
  Station.items[station]
end

def route_input
  puts "Выберите маршрут #{Route.items.keys}"
  route = gets.chomp.to_sym until Route.items.key?(route)
  Route.items[route]
end

def route_list_station(route)
  p "Выбран маршрут #{route.name}"
  print "Начальная станция - #{route.route_stations.first.name}; "
  print 'Промежуточные станции: '
  route.route_stations.slice(1...-1).each { |station| print station.name + ', ' }
  print "Конечная станция - #{route.route_stations.last.name} ;\n"
end

def route_editor
  route = route_input
  route_list_station(route)
  p '     Выберите операцию какую хотите выполнить: '
  p '     1 - добавить станцию в маршрут'
  p '     2 - удалить станцию из маршрута'
  route_editor_operation(route)
end

def route_editor_operation(route)
  operation = gets.chomp.to_i
  case operation
  when 1
    station = station_input
    p 'Выберите место по порядку в маршруте, по умолчанию добавляется предпоследней станцией'
    number = gets.chomp.to_i
    route.add_station(station, number)
    p "К маршруту #{route.name} добавлена станция #{station.name}"
  when 2
    station = station_input
    route.del_station(station)
    p "В маршруте #{route.name} удалена станция #{station.name}"
  end
  route_editor_operation(route) unless operation.zero?
end
