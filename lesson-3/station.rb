class Station


  attr_accessor :train_name

  def initialize (station_name)
    @station_name = station_name
    @station_train = []
  end

  def train_arrival(train_name)
    @station_train.push(train_name)
    p "прибыл #{train_name}"
  end

  def station_list_train
    p "типа список станции #{@station_name}"
  end

  def train_departure
    p 'отправился'
  end

end
