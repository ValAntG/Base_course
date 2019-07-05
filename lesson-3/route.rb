class Route
  attr_reader :route_stations

  def initialize(*stations)
    @route_stations = stations
  end

  def add_station(station, number = -2)
    @route_stations.insert(number, station)
  end

  def del_station(station)
    @route_stations.delete(station)
  end

  def list_station
    print "Начальная станция - #{@route_stations.first.station_name}; "
    print 'Промежуточные станции: '
    @route_stations.slice(1...-1).each { |station| print station.station_name + ', ' }
    print "Конечная станция - #{@route_stations.last.station_name} ;\n"
  end
end
