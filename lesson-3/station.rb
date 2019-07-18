class Station
  include InstanceCounter
  attr_reader :name

  def initialize(station_name)
    @name = station_name
    @station_trains = []
    register_instance
  end

  def train_arrival(train)
    if @station_trains.include?(train)
      p "Поезд № #{train.name} уже находится на станции #{@name}"
    else
      @station_trains.push(train)
      p "Поезд № #{train.name} прибыл на станцию #{@name}"
    end
  end

  def list_train
    p "Список поездов на станции #{@name}:"
    @station_trains.each { |train| p train.name }
  end

  def list_by_type
    train_by_type('cargo')
    train_by_type('pass')
  end

  def train_departure(train)
    if @station_trains.include?(train)
      @station_trains.delete(train)
      p "Поезд № #{train.name} отправился со станцию #{@name}"
    else
      p "Поезда № #{train.name} нет на станции #{@name}"
    end
  end

  private

  # Методы не используются в других классах и подклассах

  def train_by_type(type)
    print "Список #{type} поездов на станции #{@name}: "
    @station_trains.each { |train| print "#{train.name}, " if train.train_type == type }
    p "    Всего #{type} поездов на станции: #{@station_trains.select { |train| train.train_type == type }.size}"
  end
end
