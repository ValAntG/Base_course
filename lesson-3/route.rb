class Route
  include InstanceCounter

  attr_reader :name, :route_stations

  def initialize(route_name, stations)
    @name = route_name
    @route_stations = stations
    validate!
    register_instance
  end

  def validate!
    raise NameError, 'NameRouteError' if @name !~ /\A[A-Z]{1}\w{2,}\z/
  end

  def valid?
    return false if @name !~ /\A[A-Z]{1}\w{2,}\z/

    true
  end

  def add_station(station, number = -2)
    @route_stations.insert(number, station)
  end

  def del_station(station)
    @route_stations.delete(station)
  end
end
