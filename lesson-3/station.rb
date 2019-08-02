class Station
  include InstanceCounter
  include Validation
  include Acessors
  extend ObjectBlock

  strong_attr_accessor :name, String
  attr_accessor_with_history :station_trains

  validate(:name, :format, '\A[A-Z]{1}\w{2,}\z')

  def initialize(station_name)
    self.name = station_name
    @station_trains = []
    validate!
    register_instance
  end

  def train_arrival(train)
    @station_trains.push(train) unless @station_trains.include?(train)
  end

  def train_departure(train)
    @station_trains.delete(train) if @station_trains.include?(train)
  end
end
