def trains_info_by_type(type)
  trains = type.items || {}
  trains.each_value do |train|
    print "№#{train.name} с кол-вом вагонов #{train.carriages_number} ".colorize(:blue).on_yellow
    puts "находится на станции #{train.current_station.name}".colorize(:blue).on_yellow
  end
end

def trains_info
  puts '   Список пассажирских поездов:                                      '.colorize(:black).on_yellow
  trains_info_by_type(TrainPass)
  puts "   Всего пассажирских поездов: #{TrainPass.items.size}               ".colorize(:white).on_yellow
  puts '   Список грузовых поездов:                                          '.colorize(:black).on_yellow
  trains_info_by_type(TrainCargo)
  puts "   Всего грузовых поездов: #{TrainCargo.items.size}                  ".colorize(:white).on_yellow
end

def station_info_by_name_type(station, type)
  station.station_trains.each { |train| print "#{train.name}, ".green if train.train_type == type }
  puts "\n   Всего: #{station.station_trains.select { |train| train.train_type == type }.size}".green
end

def station_info
  Station.items.each_value do |station|
    puts "   Список поездов на станции #{station.name}:                       ".colorize(:black).on_yellow
    print 'пассажирскиe: '.green
    station_info_by_name_type(station, 'pass')
    print 'грузовыe: '.green
    station_info_by_name_type(station, 'cargo')
  end
  puts "   Всего станций: #{Station.items.size}                              ".colorize(:white).on_yellow
end

def station_info_all
  Station.items.each_value do |station|
    puts "   Список поездов на станции #{station.name}                       ".colorize(:black).on_yellow
    station.station_trains.each do |train|
      print "№ поезда #{train.name}, ".green
      print 'тип поезда - пассажирский '.green if train.train_type == 'pass'
      print 'тип поезда - грузовой '.green if train.train_type == 'cargo'
      print "с количеством вагонов - #{train.carriages_number}; \n".green
    end
  end
  puts "   Всего станций: #{Station.items.size}                              ".colorize(:white).on_yellow
end
