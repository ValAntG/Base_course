class Route
  include InstanceCounter
  include Validation
  extend ObjectBlock

  attr_reader :name, :route_stations

  validate(:name, :format, '\A[A-Z]{1}\w{2,}\z')
  validate(:route_stations, :type, Station)

  def initialize(route_name, stations)
    @name = route_name
    @route_stations = stations
    validate!
    register_instance
  end

  def add_station(station, number = -2)
    @route_stations.insert(number, station)
  end

  def del_station(station)
    @route_stations.delete(station)
  end
end
