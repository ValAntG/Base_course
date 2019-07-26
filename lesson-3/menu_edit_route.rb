def route_list_station(route)
  p "Выбран маршрут #{route.name}"
  print "Начальная станция - #{route.route_stations.first.name}; "
  print 'Промежуточные станции: '
  route.route_stations.slice(1...-1).each { |station| print station.name + ', ' }
  print "Конечная станция - #{route.route_stations.last.name} ;\n"
end

def route_editor
  route = input(Route.items)
  route_list_station(route)
  p '     Выберите операцию какую хотите выполнить: '
  p '     1 - добавить станцию в маршрут'
  p '     2 - удалить станцию из маршрута'
  route_editor_operation(route)
end

def route_editor_operation(route)
  operation = gets.chomp.to_i
  station = input(Station.items)
  case operation
  when 1
    p 'Выберите место по порядку в маршруте'.light_blue
    number = gets.chomp.to_i
    route.add_station(station, number)
    p "К маршруту #{route.name} добавлена станция #{station.name}"
  when 2
    route.del_station(station)
    p "В маршруте #{route.name} удалена станция #{station.name}"
  end
  route_editor_operation(route) unless operation.zero?
end
