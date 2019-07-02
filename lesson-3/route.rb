class Route
  attr_reader :route_stations

  def initialize(*station)
    @route_stations = *station
  end

  def route_add(station, i = -1)
    route_stations.insert(i, station)
  end

  def route_del(station)
    route_stations.delete(station)
  end

  def route_list
    p "Начальная станция - #{route_stations.first.station_name}"
    print 'Промежуточные станции: '
    route_stations.slice(1...-1).each{|i| print i.station_name + ', '}
    p "Конечная станция - #{route_stations.last.station_name}"
  end
end
