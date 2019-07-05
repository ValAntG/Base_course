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
    p "Скорость поезда №#{@train_name} #{@train_speed} км/ч"
  end

  def speed_up
    @train_speed += 20
  end

  def speed_slow
    return p 'Поезд остановлен, скорость уменьшить нельзя' if @train_speed.zero?

    @train_speed -= 20
  end

  def cars_number
    p "В поезде №#{@train_name} #{@train_cars_number} вагонов"
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
    arrival(station_start)
    route_add_message
  end

  def route_next
    @current_station.train_departure(self)
    arrival(route_next_station) if route_next_station
  end

  def route_info
    route_info_message(@current_station, 'текущая')
    route_info_message(route_next_station, 'следующая') if route_next_station
    route_info_message(route_prev_station, 'предыдущая') if route_prev_station
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

  def route_add_message
    print "Добавлен маршрут следования к поезду #{@train_name}, маршрут следования: "
    p @train_route.route_stations.map(&:station_name).join(', ')
  end

  def route_info_message(station, state)
    p "У поезда № #{@train_name} #{state} станция #{station.station_name}"
  end

  def arrival(station)
    @current_station = station
    @current_station.train_arrival(self)
  end
end
