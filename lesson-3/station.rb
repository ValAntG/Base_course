class Station
  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @station_trains = []
  end

  def train_arrival(train)
    if @station_trains.include?(train)
      p "Поезд № #{train.train_name} уже находится на станции #{station_name}"
    else
      @station_trains.push(train)
      p "Поезд № #{train.train_name} прибыл на станцию #{station_name}"
    end
  end

  def station_list_train
    p "Список поездов на станции #{station_name}:"
    @station_trains.each { |train| p train.train_name }
  end

  def station_list_by_type
    p "Список грузовых поездов на станции #{station_name}: "
    @station_trains.each { |i| p i.train_name if i.train_type == 'cargo' }
    p "Всего грузовых поездов на станции : #{@station_trains.select { |i| i.train_type == 'cargo' }.size}"
    p "Список пассажирских поездов на станции #{station_name}: "
    @station_trains.each { |i| p i.train_name if i.train_type == 'pass' }
    p "Всего пассажирских поездов на станции : #{@station_trains.select { |i| i.train_type == 'pass' }.size}"
  end

  def train_departure(train)
    if @station_trains.include?(train)
      @station_trains.delete(train)
      p "Поезд № #{train.train_name} отправился со станцию #{station_name}"
    else
      p "Поезда № #{train.train_name} нет на станции #{station_name}"
    end
  end
end
