class Station
  include InstanceCounter

  attr_reader :name, :station_trains

  def initialize(station_name)
    @name = station_name
    @station_trains = []
    validate!
    register_instance
  end

  def validate!
    raise NameError, 'NameStationError' if @name !~ /\A[A-Z]{1}\w{2,}\z/
  end

  def valid?
    return false if @name !~ /\A[A-Z]{1}\w{2,}\z/

    true
  end

  def train_arrival(train)
    @station_trains.push(train) unless @station_trains.include?(train)
  end

  def train_departure(train)
    @station_trains.delete(train) if @station_trains.include?(train)
  end
end
