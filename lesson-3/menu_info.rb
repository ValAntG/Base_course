def train_info_by_type(type)
  trains = type.items || {}
  trains.each_value do |train|
    p "№#{train.name} с кол-вом вагонов #{train.carriages_number} находится на станции #{train.current_station.name}"
  end
end

def train_info
  p 'Список пассажирских поездов:'
  train_info_by_type(TrainPass)
  p 'Список грузовых поездов:'
  train_info_by_type(TrainCargo)
end

def station_info_by_name_type(station, type)
  station.station_trains.each { |train| print "#{train.name}, " if train.train_type == type }
  p "     Всего: #{station.station_trains.select { |train| train.train_type == type }.size}"
end

def station_info
  Station.items.each_value do |station|
    p "Список поездов на станции #{station.name}: "
    print 'пассажирских: '
    station_info_by_name_type(station, 'pass')
    print 'грузовых: '
    station_info_by_name_type(station, 'cargo')
  end
end
