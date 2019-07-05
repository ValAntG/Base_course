class Train
  attr_reader :train_name, :train_type

  def initialize(train_name, train_type, train_cars_number)
    @train_name = train_name
    @train_type = train_type
    @train_cars_number = train_cars_number.to_i
    @train_speed = 0
    @train_route = nil
    @current_station = nil
  end

  def speed
    p "Скорость поезда №#{train_name} #{@train_speed} км/ч"
  end

  def speed_up
    @train_speed += 20
  end

  def speed_slow
    return p 'Поезд остановлен, скорость уменьшить нельзя' if @train_speed.zero?

    @train_speed -= 20
  end

  def cars_number
    p "В поезде №#{train_name} #{@train_cars_number} вагонов"
  end

  def cars_hook
    return @train_cars_number += 1 if @train_speed.zero?

    p 'Поезд в движении, прицепить вагон нельзя'
  end

  def cars_unhook
    return p 'Вагонов больше нет' if @train_speed.zero? && @train_cars_number.zero?
    return @train_cars_number -= 1 if @train_speed.zero?

    p 'Поезд в движении, отцепить вагон нельзя'
  end

  def route_add(route, station_start = route.route_stations.first)
    @train_route = route
    station_start.train_arrival(self)
    @current_station = station_start
    print "Добавлен маршрут следования к поезду #{train_name}, маршрут следования: "
    intermed_station = route.route_stations.map(&:station_name)
    p intermed_station.join(', ')
  end

  def route_next
    @current_station.train_departure(self)
    return unless @train_route.route_stations[0...-1].include?(@current_station)

    @current_station = route_next_station
    @current_station.train_arrival(self)
  end

  def route_info
    p "Поезд № #{train_name} находится на станции #{@current_station.station_name}"
    return if @current_station == @train_route.route_stations.last

    p "У поезда № #{train_name} следующая станция #{route_next_station.station_name}"
    return if @current_station == @train_route.route_stations.first

    p "У поезда № #{train_name} предыдущая станция #{route_prev_station.station_name}"
  end

  private

  def station_of_route(position_change)
    station_index = @train_route.route_stations.index(@current_station) + position_change
    @train_route.route_stations[station_index]
  end

  def route_next_station
    station_of_route(+1)
  end

  def route_prev_station
    station_of_route(-1)
  end
end
