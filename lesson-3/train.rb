class Train
  attr_reader :train_name, :train_type

  def initialize(train_name, train_type, train_cars_number)
    @train_name = train_name
    @train_type = train_type
    @train_cars_number = train_cars_number.to_i
    @train_speed = 0
    @train_route = 0
    @number_station = 0
  end

  def train_speed
    p "Скорость поезда #{@train_speed} км/ч"
  end

  def train_speed_up
    @train_speed += 20
  end

  def train_speed_slow
    if @train_speed.zero?
      p 'Поезд остановлен, скорость уменьшить нельзя'
    else
      @train_speed -= 20
    end
  end

  def train_cars_number
    p "Количество вагонов в поезде #{@train_cars_number} шт."
  end

  def train_cars_hook
    if @train_speed.zero?
      @train_cars_number += 1
    else
      p 'Поезд в движении, прицепить вагон нельзя'
    end
  end

  def train_cars_unhook
    if @train_speed.zero?
      if @train_cars_number.zero?
        p 'Вагонов больше нет'
      else
        @train_cars_number -= 1
      end
    else
      p 'Поезд в движении, отцепить вагон нельзя'
    end
  end

  def train_route_add(route, station_start = route.route_stations.first)
    @train_route = route
    station_start.train_arrival(self)
    @number_station = route.route_stations.index(station_start)
    print "Добавлен маршрут следования к поезду #{train_name}, маршрут следования: "
    route.route_stations.each { |i| print i.station_name + ', ' }
  end

  def train_route_next
    @train_route.route_stations[@number_station].train_departure(self)
    if @number_station < @train_route.route_stations.count - 1
      @number_station += 1
      @train_route.route_stations[@number_station]
      @train_route.route_stations[@number_station].train_arrival(self)
    end
  end

  def train_route_info
    p "Поезд находится на станции #{@train_route.route_stations[@number_station].station_name}"
    p "Предыдущая станция у поезда #{@train_route.route_stations[@number_station - 1].station_name}"
    if @number_station < @train_route.route_stations.count - 1
      p "Следующая станция у поезда #{@train_route.route_stations[@number_station + 1].station_name}"
    end
  end
end
