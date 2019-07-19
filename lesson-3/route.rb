class Route
  attr_reader :name, :route_stations

  include InstanceCounter

  def initialize(route_name, stations)
    @name = route_name
    @route_stations = stations
    register_instance
  end

  def add_station(station, number = -2)
    @route_stations.insert(number, station)
  end

  def del_station(station)
    @route_stations.delete(station)
  end
end
