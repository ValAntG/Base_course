class Station
  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @station_trains = []
  end

  def train_arrival(train)
    if @station_trains.include?(train)
      p "Поезд № #{train.train_name} уже находится на станции #{@station_name}"
    else
      @station_trains.push(train)
      p "Поезд № #{train.train_name} прибыл на станцию #{@station_name}"
    end
  end

  def list_train
    p "Список поездов на станции #{@station_name}:"
    @station_trains.each { |train| p train.train_name }
  end

  def list_by_type
    train_by_type('cargo')
    train_by_type('pass')
  end

  def train_departure(train)
    if @station_trains.include?(train)
      @station_trains.delete(train)
      p "Поезд № #{train.train_name} отправился со станцию #{@station_name}"
    else
      p "Поезда № #{train.train_name} нет на станции #{@station_name}"
    end
  end

  private
  # Методы не используются в других классах и подклассах

  def train_by_type(type)
    print "Список #{type} поездов на станции #{@station_name}: "
    @station_trains.each { |train| print "#{train.train_name}, " if train.train_type == type }
    p "    Всего #{type} поездов на станции: #{@station_trains.select { |train| train.train_type == type }.size}"
  end
end
