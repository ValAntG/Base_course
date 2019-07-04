class Train
  attr_reader :train_name, :train_type

  def initialize(train_name, train_type, train_cars_number)
    @train_name = train_name
    @train_type = train_type
    @train_cars_number = train_cars_number.to_i
    @train_speed = 0
    @train_route = nil
    @number_station = 0
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
    route.route_stations.each { |station| print station.station_name + ', ' }
    puts
  end

  def route_next
    station_of_route(0).train_departure(self)
    if @train_route.route_stations[0...-1].include?(station_of_route(0))
      @current_station = station_of_route(+1)
      station_of_route(0).train_arrival(self)
    end
  end

  def route_info
    p "Поезд №#{train_name} находится на станции #{station_of_route(0).station_name}"
    if station_of_route(0) != @train_route.route_stations.first
      p "У поезд №#{train_name} предыдущая станция #{station_of_route(-1).station_name}"
    end
    if station_of_route(0) != @train_route.route_stations.last
      p "У поезда №#{train_name} следующая станция #{station_of_route(+1).station_name}"
    end
  end

  private

  def station_of_route(position_change)
    station_index = @train_route.route_stations.index(@current_station) + position_change
    @train_route.route_stations[station_index]
  end
end
