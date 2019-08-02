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
  puts '     Выберите операцию какую хотите выполнить: '.colorize(:green).on_blue
  puts '     1 - добавить станцию в маршрут            '.colorize(:white).on_green
  puts '     2 - удалить станцию из маршрута           '.colorize(:white).on_green
  puts '     3 - информация по данному маршруту        '.colorize(:yellow).on_green
  puts '     0 - для выхода в главное меню             '.colorize(:green).on_blue
  route_editor_operation(route)
end

def route_editor_add(route)
  station = input(Station.items)
  puts 'Выберите место по порядку в маршруте'.light_blue
  number = gets.chomp.to_i
  route.add_station(station, number)
  p "К маршруту #{route.name} добавлена станция #{station.name}"
end

def route_editor_del(route)
  station = input(Station.items)
  route.del_station(station)
  p "В маршруте #{route.name} удалена станция #{station.name}"
end

def route_editor_operation(route)
  operation = gets.chomp.to_i
  case operation
  when 1
    route_editor_add(route)
  when 2
    route_editor_del(route)
  when 3
    route_list_station(route)
  end
  route_editor_operation(route) unless operation.zero?
end
