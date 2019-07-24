def trains_info_by_type(type)
  trains = type.items || {}
  trains.each_value do |train|
    p "  №#{train.name} с кол-вом вагонов #{train.carriages_number} находится на станции #{train.current_station.name}"
  end
end

def trains_info
  puts '   Список пассажирских поездов:'.green
  trains_info_by_type(TrainPass)
  puts "   Всего пассажирских поездов: #{TrainPass.items.size}".yellow
  puts '   Список грузовых поездов:'.green
  trains_info_by_type(TrainCargo)
  puts "   Всего грузовых поездов: #{TrainCargo.items.size}".yellow
end

def station_info_by_name_type(station, type)
  station.station_trains.each { |train| print "#{train.name}, " if train.train_type == type }
  puts "\n     Всего: #{station.station_trains.select { |train| train.train_type == type }.size}"
end

def station_info
  Station.items.each_value do |station|
    puts "   Список поездов на станции #{station.name}: ".green
    print '  пассажирскиe: '
    station_info_by_name_type(station, 'pass')
    print '  грузовыe: '
    station_info_by_name_type(station, 'cargo')
  end
  puts "   Всего станций: #{Station.items.size}".yellow
end

def station_info_all
  Station.items.each_value do |station|
    puts "   Список поездов на станции #{station.name}: ".green
    station.station_trains.each do |train|
      print "№ поезда #{train.name}, "
      print 'тип поезда - пассажирский ' if train.train_type == 'pass'
      print 'тип поезда - грузовой ' if train.train_type == 'cargo'
      print "с количеством вагонов - #{train.carriages_number}; \n"
    end
  end
  puts "   Всего станций: #{Station.items.size}".yellow
end
