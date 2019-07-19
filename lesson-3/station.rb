class Station
  include InstanceCounter
  attr_reader :name, :station_trains

  def initialize(station_name)
    @name = station_name
    @station_trains = []
    register_instance
  rescue StandardError => e
    p "StandardError: #{e.message}"
  end

  def train_arrival(train)
    @station_trains.push(train) unless @station_trains.include?(train)
  end

  def train_departure(train)
    @station_trains.delete(train) if @station_trains.include?(train)
  end
end
