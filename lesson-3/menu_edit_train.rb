def station_add(train)
  print "Выберите станцию на которой размещается поезд #{Station.items.keys}".light_blue
  station_name = gets.chomp.to_sym until Station.items.key?(station_name)
  train.arrival(Station.items[station_name])
  p "Поезд № #{train.name} прибыл на станцию #{@name}"
end

def train_editor
  train = input(Hash(TrainCargo.items).merge(Hash(TrainPass.items)))
  p "     Выберите операцию какую хотите выполнить с поездом #{train.name}:"
  p '     1 - прицепить вагон'
  p '     2 - отцепить вагон'
  p '     3 - операция с вагоном'
  p '     4 - увеличить скорость'
  p '     5 - уменьшить скорость'
  puts '      6 - информация по поезду'.yellow
  p '     7 - добавить поезд на станцию'
  p '     8 - добавить маршрут следования поезда'
  p '     9 - добавить имя компании'
  p '     0 - для выхода в главное меню'
  train_editor_operation(train)
end

def train_edit_speed_up(train)
  print 'Введите скорость на которую хотите изменить скорость: '.light_blue
  speed = gets.chomp.to_i
  train.speed_up(speed)
  p "Поезд № #{train.name} увеличил скорость на #{speed} км/ч"
end

def train_edit_speed_slow(train)
  print 'Введите скорость на которую хотите изменить скорость: '.light_blue
  speed = gets.chomp.to_i
  return puts 'Поезд остановлен, скорость уменьшить нельзя'.red if train.train_speed.zero?

  train.speed_slow(speed)
  p "Поезд № #{train.name} уменьшил скорость на #{speed} км/ч"
end

def train_name(train)
  print 'Введите имя компании или введите 0 чтобы посмотреть какой компании принадлежит поезд: '.light_blue
  name_company = gets.chomp.to_s
  train.company_name_save(name_company) if name_company != '0'
  p "Поезд принадлежит компании #{train.company_name_show}"
end

def carriages_add(train)
  print 'Введите количество мест в пассажирском вагоне: '.light_blue if train.train_type == 'pass'
  print 'Введите объем грузового вагона: '.light_blue if train.train_type == 'cargo'
  space = gets.chomp.to_i
  train.carriages_hook(space)
  p "К поезду № #{train.name} добавлен пассажирский вагон c количеством мест - #{space}" if train.train_type == 'pass'
  p "К поезду № #{train.name} добавлен грузовой вагон c объемом - #{space}" if train.train_type == 'cargo'
end

def train_info(train)
  puts "Список вагонов поезда № #{train.name}:".green
  Train.object_block(train.train_carriages) do |carriage|
    carriage.each_with_index do |car, index|
      print "№ вагона #{index + 1} "
      if car.carriage_type == 'pass'
        print 'тип вагона - пассажирский, '
        print "количество свободных мест - #{car.space_free}, "
        print "количество занятых мест - #{car.space_booked};\n"
      elsif car.carriage_type == 'cargo'
        print 'тип вагона - грузовой, '
        print "количество свободного объема в вагоне - #{car.space_free}, "
        print "количество занятого объема грузом в вагоне - #{car.space_booked};\n"
      end
    end
    puts "Всего вагонов - #{train.carriages_number}, поезд двигается со скоростью - #{train.train_speed}.".yellow
  end
end

def train_editor_operation(train)
  operation = gets.chomp.to_i
  case operation
  when 1
    carriages_add(train)
  when 2
    train.carriages_unhook
    p "От поезда № #{train.name} отцеплен вагон"
  when 3
    carriage_editor(train)
  when 4
    train_edit_speed_up(train)
  when 5
    train_edit_speed_slow(train)
  when 6
    train_info(train)
  when 7
    station_add(train)
  when 8
    route = input(Route.items)
    station_start = input(Station.items)
    train.route_add(route, station_start)
  when 9
    train_name(train)
  end
  train_editor_operation(train) unless operation.zero?
end
